class SubsController < ApplicationController
  before_action :require_login
  # before_action :ensure_sub_ownership, only: [:edit, :update]


  def edit
    @sub = Sub.find(params[:id])
    if current_user != @sub.moderator
      flash.now[:errors] = ["You're not the moderator!  Access denied."]
      redirect_to sub_url(@sub)
    end
  end


  def update
    @sub = Sub.find(params[:id])
    # fail
    @sub.update_attributes(sub_params)
    redirect_to sub_url(@sub)
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
