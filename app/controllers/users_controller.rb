class UsersController < ApplicationController

  def new
    @user = User.new
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
      redirect_to "/login"
    end
  end

  def logout
    session[:logged_in_user_id] = nil
    redirect_to "/"
  end

  def create
    @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
    )
    if @user.save

      flash[:sucess] = "You've been added"
      if User.last.email.include?("@theironyard.com")
        User.last.update(
        admin: true,
        publisher: true,
        editor: true,
        )
      end
    redirect_to "/login"
  else
    flash[:danger]= "Fields can't be blank"
    render :new
  end
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
