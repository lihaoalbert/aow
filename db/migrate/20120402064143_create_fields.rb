class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.string :label
      t.integer :field_group_id
      t.string :as
      t.integer :position

      t.timestamps
    end
  end
end
