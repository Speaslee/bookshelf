class CreateAddCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :user_id
      t.integer :book_id
      t.boolean :overdue
      t.timestamps null: false
    end

    add_column :bookself, :name, :string
  end
end
