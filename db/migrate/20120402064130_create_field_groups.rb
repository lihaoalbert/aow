class CreateFieldGroups < ActiveRecord::Migration
  def change
    create_table :field_groups do |t|
      t.string :name
      t.string :label
      t.integer :position
      t.integer :tag_id

      t.timestamps
    end
  end
end
