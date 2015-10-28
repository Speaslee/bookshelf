class User< ActiveRecord::Base
  has_secure_password

  validates_presence_of :email, :name, :password

  belongs_to :library
  has_many :books, through: :checkouts
end
