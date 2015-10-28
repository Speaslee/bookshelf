class UsersController < ApplicationController

  def new
  end

  def login
  end

  def login_page
    found=  User.where(
    email: params[:email],
    ).first

    if found.authenticate(params[:password])
  #  if found
      session[:logged_in_user_id] = found.id
      redirect_to "/libraries"
    else
      "Please re-enter your password and email"
      redirect_to "/login"
    end
  end

  def logout
    session[:logged_in_user_id] = nil
    redirect_to "/"
  end

def unique_checkout
checkout = Checkout.where(user_id: current_user.id).to_a

end

  def create
    User.create!(
    name: params[:name],
    email: params[:email],
    password: params[:password]
    )
    redirect_to "/login"
  end

end
