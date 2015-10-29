class AddBookInfo < ActiveRecord::Migration
  def change
    add_column :books, :publisher, :string
    add_column :books, :published_date, :string
    add_column :books, :description, :text
    add_column :books, :isbn, :string
    add_column :books, :page_count, :string
    add_column :books, :average_rating, :string
    add_column :books, :preview_link, :string
    add_column :books, :image_link, :string
  end
end
