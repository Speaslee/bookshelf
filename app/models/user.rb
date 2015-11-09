class User< ActiveRecord::Base
  belongs_to :library
  has_many :checkouts
  has_many :addresses
  has_many :checked_out_books, through: :checkouts, source: :books

  has_secure_password

  validates_presence_of :email, :name, :password_digest
  # def unique_checkout
  #   checkedout = Checkout.where(user_id: current_user.id).to_a
  #   ucheckout = checkedout.uniq{|checkout| checkout.book_id}}
  # end
  # ucheckout
  # end

  def self.from_omniauth(access_token)
    data =  access_token
    user = User.where(:email => data["email"].first)
    unless user
      user = User.create(
        name:data["name"]
        email: data["email"],
        password: [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
      )
      flash[:notice] = "Successfully created Your password is #{:password} "
    end
    user
end
end
