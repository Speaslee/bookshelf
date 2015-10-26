class User< ActiveRecord::Base
  belongs_to :library
  has_many :books, through: :checkouts
end
