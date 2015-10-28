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

  def create
    User.create!(
    name: params[:name],
    email: params[:email],
    password: params[:password]
    )
    redirect_to "/login"
  end

  def admin
    unless current_user.admin
      redirect_to "/"
    end
  end

  def assign_admin
    if current_user.admin
      user = User.find params[:id]
      good_params = params.permit(:publisher, :editor, :admin).select{|k,v| v.present?}
      user.update(
      good_params
      )
      redirect_to "/libraries/user_list"
    else
      redirect_to "/"
    end
  end

  def delete_admin
    if current_user.admin
      user = User.find params[:id]
      good_params = params.permit(:publisher, :editor, :admin).select{|k,v| v.present?}
      user.update(
      good_params
      )
      redirect_to "/libraries/user_list"
    else
      redirect_to "/"
    end
  end
end
