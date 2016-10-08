class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])
    if @user
      login(@user)
      flash[:errors] = ["Welcome back!"]
      redirect_to subs_url
    else
      flash.now[:errors] << @user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout(current_user)
    render :new
  end

  protected

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
