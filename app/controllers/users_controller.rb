class UsersController < ApplicationController
  expose(:user)

  def create
    if user.save
      redirect_to :root
    else
      render 'pages/home'
    end
  end

  def user_params
    params.require(:user).permit(:phone, :station_id)
  end

end
