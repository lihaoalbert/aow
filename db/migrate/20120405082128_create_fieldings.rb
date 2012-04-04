class CreateFieldings < ActiveRecord::Migration
  def change
    create_table :fieldings do |t|
      t.integer :field_group_id
      t.integer :product_id

      t.timestamps
    end
  end
end
