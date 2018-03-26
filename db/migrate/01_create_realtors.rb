class CreateRealtors < ActiveRecord::Migration
  def change
    create_table :realtors do |t|
      t.string :name
      t.integer :listing_id
      t.integer :customer_id
    end
  end
end
