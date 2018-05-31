class GourmetfavoritesController < ApplicationController

  def create
  	gourmet = Gourmet.find(params[:gourmet_id])
  	gourmetfavorite = current_user.gourmetfavorites.new(gourmet_id: gourmet.id)
  	gourmetfavorite.save
  	redirect_back(fallback_location: root_path)
  end

  def destroy
  	gourmet = Gourmet.find(params[:gourmet_id])
  	gourmetfavorite = current_user.gourmetfavorites.find_by(gourmet_id: params[:gourmet_id])
  	gourmetfavorite.destroy
  	redirect_back(fallback_location: root_path)
  end
end
