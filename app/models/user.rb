class User< ActiveRecord::Base
  belongs_to :bookshelf
  has_many :books, through: :bookshelf
end
