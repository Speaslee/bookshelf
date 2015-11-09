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
        librarian: true,
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
      good_params = params.permit(:librarian, :editor, :admin).select{|k,v| v.present?}
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
      good_params = params.permit(:librarian, :editor, :admin).select{|k,v| v.present?}
      user.update(
      good_params
      )
      redirect_to "/libraries/user_list"
    else
      redirect_to "/"
    end
  end

  def google_oauth2
    auth_hash =request.env["omniauth.auth"]
     if User.from_omniauth()
       session[:user_id] = @user.id
       redirect_to root_path
    else
      @user = User.new(
      name: auth_hash['info']['name'],
      email: auth_hash['info']['email']
      )
      @user.save
      redirect_to root_path
    end
  end




end
