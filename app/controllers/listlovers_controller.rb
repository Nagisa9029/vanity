class ListloversController < ApplicationController

  def create
  	list = List.find(params[:list_id])
  	listlover = current_user.listlovers.new(list_id: list.id)
  	listlover.save
  	redirect_back(fallback_location: root_path)
  end

  def destroy
  	list = List.find(params[:list_id])
  	listlover = current_user.listlovers.find_by(list_id: params[:list_id])
  	listlover.destroy
  	redirect_back(fallback_location: root_path)
  end
end
