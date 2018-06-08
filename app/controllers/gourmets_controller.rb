class GourmetsController < ApplicationController
before_action :authenticate_user!, only:[:edit]
before_action :update_gourmetcomment, only:[:show]
  #def new
  #end

  def create
      @nouveaugourmet = Gourmet.new(gourmet_params)
      @nouveaugourmet.user_id = current_user.id
      if  @nouveaugourmet.save
          gourmetimage = @nouveaugourmet.gourmetimages.build
          gourmetimage.save
          redirect_to gourmets_path
      else
          @user = User.find(current_user.id)
          @gourmets = Gourmet.all
          render :index
      end
  end

  def index
      #@gourmets = Gourmet.all.reverse_order
      @gourmets = @search_gourmet.result.reverse_order
      @gourmets = @gourmets.page(params[:page])
      @gourmetcomment = Gourmetcomment.new
  end

  def follower
     followers = current_user.following
     @gourmets = Gourmet.where(user_id: followers ).reverse_order
     @gourmets = @gourmets.page(params[:page])
     @gourmetcomment = Gourmetcomment.new
  end

  def mycommit
      @gourmets = Gourmet.where(user_id: current_user.id).reverse_order
      @gourmets = @gourmets.page(params[:page])
      @gourmetcomment = Gourmetcomment.new
  end

  def show
      @gourmet = Gourmet.find(params[:id])
      @gourmetimages = Gourmetimage.where(gourmet_id: params[:id])
      @gourmetcomment = Gourmetcomment.new
  end

  def update_gourmetcomment
      if user_signed_in?
        gourmet = Gourmet.find(params[:id])
        @gourmetcomments = Gourmetcomment.where(gourmet_id: gourmet.id)
        if gourmet.user_id == current_user.id
           @gourmetcomments.each do |gourmetcomment|
              @gourmetcomment = gourmetcomment
              @gourmetcomment.read_flg = false
              @gourmetcomment.save
           end
        end
      end
  end

  def edit
      @gourmet = Gourmet.find(params[:id])
  end

  def update
      @gourmet = Gourmet.find(params[:id])
      @gourmet.update(gourmet_params)
      redirect_to gourmets_path
  end

  def destroy
      gourmet = Gourmet.find(params[:id])
      if gourmet.destroy
        redirect_to gourmets_path
      else
        redirect_to gourmets_path
      end

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
