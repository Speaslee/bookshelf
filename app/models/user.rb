class User< ActiveRecord::Base
  belongs_to :library
  has_many :checkouts
  has_many :checked_out_books, through: :checkouts, source: :books

  has_secure_password

  validates_presence_of :email, :name, :password_digest


end
