class LibrariesController < ApplicationController

  def index
  end

  def show
    unless current_user
      redirect_to "/"
    end
  end

def userlist
  unless current_user
    redirect_to "/"
  end
end


end
