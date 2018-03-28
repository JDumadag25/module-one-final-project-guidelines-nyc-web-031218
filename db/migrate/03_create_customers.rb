class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :user_name
      t.string :password
      t.string :city
      t.string :neighborhood
      t.integer :bedrooms
      t.integer :bathrooms
      t.boolean :pets
      t.float :lowest_price
      t.float :highest_price
      t.string :phone
      t.string :email
      t.integer :realtor_id
    end
  end
end
