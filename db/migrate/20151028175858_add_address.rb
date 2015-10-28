class AddAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :street
      t.string :zip
      t.string :state
      t.string :city

    end
  end
end
