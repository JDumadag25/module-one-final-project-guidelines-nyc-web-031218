class CreateRealtors < ActiveRecord::Migration
  def change
    create_table :realtors do |t|
      t.string :name
      t.string :user_name
      t.string :password
      t.string :phone
      t.string :email
    end
  end
end
