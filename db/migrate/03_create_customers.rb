class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :city
      t.string :neighborhood
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :pets?
      t.float :price_range
      t.string :property_type
      t.integer :realtor_id
    end
  end
end
