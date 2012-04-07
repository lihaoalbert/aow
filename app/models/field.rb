class Field < ActiveRecord::Base
  belongs_to :field_group

  default_scope order("position DESC")

  SAFE_DB_TRANSITIONS = {
    :any => [[:date, :time, :timestamp], [:integer, :float]],
    :one => {:string => :text}
  }

  FIELD_TYPES = {
    'string'      => :string,
    'text'        => :text,
    'select'      => :string,
    'multiselect' => :string,
    'boolean'     => :boolean,
    'date'        => :date,
    'decimal'     => [:decimal, {:precision => 15, :scale => 2}],
    'integer'     => :integer,
  }

  before_create     :add_column
  after_save        :add_collection_to_options
  after_validation  :update_column, on: "update"
  validates_presence_of :label, :as
  validates_uniqueness_of :name, :label
  validates_length_of :label, :maximum => 80
  validates_inclusion_of :as, in: FIELD_TYPES.keys, message: "Invalid Field Type."

  def option_name
    self.name ? table_name << '|' << self.name : nil
  end

  def collection
    option = Option.find_by_name(option_name)
    @collection = option ? option.value : ""
  end

  def collection= (val)
    # filter value
    val ||= ""
    @collection = val.split(",").map{|s|s.strip}.compact.uniq.join(",")
  end

  def add_collection_to_options
    option = Option.find_or_create_by_name(option_name)
    option.value = @collection
    option.save
  end

  def self.field_types
    @field_types ||= FIELD_TYPES.inject({}) do |hash, n|
      arr = [n[1]].flatten
      hash[n[0]] = {type: arr[0], options: arr[1]}
      hash
    end
  end

  def column_type(field_type = self.as)
    (opts = Field.field_types[field_type]) ? opts[:type] : raise("Unknown field_type: #{field_type}")
  end

  def available_as
    Field.field_types.reject do |new_type, params|
      db_transition_safety(as, new_type) == :unsafe
    end
  end

  def input_options
    #input_html = {:maxlength => attributes[:maxlength]}
    input_html = {}

    p attributes.to_yaml

    attributes.reject { |k,v|
      !%w(as collection disabled label placeholder required).include?(k) or v.blank?
    }.symbolize_keys.merge(:input_html => input_html)
  end

  def collection_string=(value)
    self.collection = value.split("|").map(&:strip).reject(&:blank?)
  end
  def collection_string
    collection.try(:join, "|")
  end

  def render_value(object)
    render object.send(name)
  end

  def render(value)
    case as
    when 'checkbox'
      value.to_s == '0' ? "no" : "yes"
    when 'date'
      value && value.strftime(I18n.t("date.formats.default"))
    when 'datetime'
      value && value.strftime(I18n.t("time.formats.short"))
    when 'check_boxes'
      value = YAML.load(value) if value.is_a?(String)
      value.select(&:present?).in_groups_of(2, false).map {|g| g.join(', ')}.join("<br />".html_safe) if Array === value
    else
      value.to_s
    end
  end

  protected

  # When changing a custom field's type, it may be necessary to
  # change the column type in the database. This method returns
  # the safety of a given transition.
  # Returns:
  #   :null   => no transition needed
  #   :safe   => transition is safe
  #   :unsafe => transition is unsafe
  def db_transition_safety(old_type, new_type = self.as)
    old_col, new_col = [old_type, new_type].map{|t| column_type(t) }
    return :null if old_col == new_col  # no transition needed
    return :safe if SAFE_DB_TRANSITIONS[:one].any? do |start, final|
      old_col == start && new_col == final  # one-to-one
    end
    return :safe if SAFE_DB_TRANSITIONS[:any].any? do |col_set|
      [old_col, new_col].all?{|c| col_set.include?(c)}  # any-to-any
    end
    :unsafe # Else, unsafe.
  end

  def table_name
    "products"
  end

  def klass
    "Product".constantize
  end

  def klass_column_names
    klass.columns.map(&:name)
  end

  def generate_column_name
    # Generate column name for custom field.
    # If column name is already taken, a numeric suffix is appended.
    # Example column sequence: cf_custom, cf_custom_2, cf_custom_3, ...
    suffix = nil
    field_name = 'cf_' + Pinyin.t(label).downcase.gsub(/[^a-z0-9]+/, '_')
    suffix = (suffix || 1) + 1 while (final_name = [field_name, suffix].compact.join('_')) && klass_column_names.include?(final_name)
    final_name
  end

  # Returns options for ActiveRecord operations
  def column_options
    Field.field_types[self.as][:options] || {}
  end

  def add_column
    self.name = generate_column_name if name.blank?
    connection.add_column(table_name, name, column_type, column_options)
    klass.reset_column_information
  end

  def update_column
    # Change database column type if appropriate
    # (NOTE: Columns will never be renamed or destroyed)
    if self.errors.empty? && db_transition_safety(as_was) == :safe
      connection.change_column(table_name, name, column_type, column_options)
      klass.reset_column_information
    end
  end
end
