class Bookshelf < ActiveRecord::Base
  has_many :users
  has_many :books

  vailidates_presence_of :user_id, :name

end
