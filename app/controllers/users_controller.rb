class UsersController < ApplicationController

  def new
  end

  def login

  def login_page name, password
    name = params[:email]
    password = params[:password]
    User.where(email: "#{name}" and password: "#{password}")
  end

  end

  def create
    User.create (
    name: params[:name]
    email: params[:email]
    password: params[:password]
    )
    redirect_to "/login"
  end

end
