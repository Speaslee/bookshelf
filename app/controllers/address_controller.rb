class AddressController < ApplicationController
  def edit
    unless current_user
      redirect_to "/libraries"
    end
  end

  def new
    @address = Address.new
    unless current_user
      redirect_to "/libraries"
    end
  end

  def create
    if current_user
      @address = Address.new(
        user_id: current_user.id,
        street: params[:street],
        state: params[:state],
        city: params[:city],
        zip: params[:zip]
        )
        if @address.save
          flash[:sucess] = "Address added"
        redirect_to "/libraries/users/profile/#{current_user.id}"
      else
        flash[:danger]= "Fields can't be blank"
        render :new
      end
      else
        redirect_to "/"
      end
    end

    def delete
      if current_user
        address = Address.find params[:id]
        address.destroy
        redirect_to "/libraries/users/profile/#{current_user.id}"
      else
        redirect_to "/"
      end
    end


  def edit_user
    if current_user
      good_params = params.permit(:street, :zip, :state, :city).select{|k,v| v.present?}
      current_user.update(
      good_params
      )
      redirect_to "/libraries/users/profile/#{current_user.id}"
    else
      redirect_to "/"
    end
  end
end
