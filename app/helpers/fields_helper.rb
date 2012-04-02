module FieldsHelper

  # Returns the list of :null and :safe database column transitions.
  # Only these options should be shown on the custom field edit form.
  def field_edit_as_options(field)
    # Return every available field_type if no restriction
    options = field.as.blank? ? Field.field_types.keys : field.available_as.keys
    options.map{|k| [t("field_types.#{k}"), k] }
  end

  def field_group_options
    FieldGroup.all.map {|fg| [fg.name, fg.id]}
  end

end
