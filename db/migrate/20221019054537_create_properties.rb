class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.string :rent
      t.string :address
      t.integer :building_age
      t.text :remark

      t.timestamps
    end
  end
end
