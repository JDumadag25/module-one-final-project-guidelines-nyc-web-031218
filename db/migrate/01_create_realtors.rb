class CreateRealtors < ActiveRecord::Migration
  def change
    create_table :realtors do |t|
      t.string :name
    end
  end
end
