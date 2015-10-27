class User< ActiveRecord::Base
  has_secure_password
  
  belongs_to :library
  has_many :books, through: :checkouts
end
