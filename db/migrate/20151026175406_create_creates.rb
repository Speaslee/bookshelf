class CreateCreates < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :password

      t.timestamps null: false
    end

    create_table :bookself do |t|
      t.integer :user_id
      t.integer :book_id
  end

  create_table :books do |t|
    t.string :title, null: false
    t.string :author
    t.string :tagline
    t.datetime :checked_out
    t.datetime :due_date
  end
end
end
