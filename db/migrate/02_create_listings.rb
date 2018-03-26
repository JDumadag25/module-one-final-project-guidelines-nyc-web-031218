class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :address
      t.string :city
      t.string :neighborhood
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :pets?
      t.float :price
      t.string :property_type
      t.integer :realtor_id
    end
  end
end
