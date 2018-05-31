class Admins::GourmetsController < ApplicationController
#before_action :authenticate_admin!

  def index
      #@gourmets = Gourmet.all.reverse_order
      @gourmets = @search_gourmet.result.reverse_order
  end

  def show
      @gourmet = Gourmet.find(params[:id])
      @gourmetimages = Gourmetimage.where(gourmet_id: params[:id])
  end

  def destroy
      @gourmet = Gourmet.find(params[:id])
      @gourmet.destroy
      redirect_to admins_gourmets_path
  end

private
  def gourmet_params
      params.require(:gourmet).permit(:name,
                                      :name_kana,
                                      :category,
                                      :tel,
                                      :postal_code,
                                      :address,
                                      :street,
                                      :url,
                                      :pr,
                                      :g_flg,
                                      :user_id,{
                                        gourmetimages_attributes:[
                                        :id,
                                        :gourmet_id,
                                        :image,
                                        :_destroy
                                      ]})
  end
end
