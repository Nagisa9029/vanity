class PopularsController < ApplicationController
before_action :authenticate_user!

  def index
    @populars = Popular.where(user_id: current_user.id).all
  end

  def create
    @user_id = current_user.id
    @gourmet_id = Gourmet.find(params[:id]).id
    @popular = Popular.new(gourmet_id: @gourmet_id, user_id: @user_id)

    @popular.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @popular = Popular.find(params[:id])
    if @popular.destroy
       redirect_back(fallback_location: root_path)
    end
  end
end
