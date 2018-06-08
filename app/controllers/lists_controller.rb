class ListsController < ApplicationController
  #def new
  #    @nouveaulist = List.new
  #end

  def create
      @nouveaulist = List.new(list_params)
      @nouveaulist.user_id = current_user.id
      if  @nouveaulist.save
          listimage = @nouveaulist.listimages.build
          listimage.save
          redirect_to list_path(id: @nouveaulist.id)
      else
          @user = User.find(current_user.id)
          @lists = List.all
          render :index
      end
  end

  def index
      #@lists = List.all.reverse_order
      @search_list = List.search(params[:q])
      @lists = @search_list.result.reverse_order
      @lists = @lists.page(params[:page])
  end

  def show
      @list = List.find(params[:id])
      @listimages = Listimage.where(list_id: params[:id])
  end

  def edit
      @list = List.find(params[:id])
  end

  def update
      @list = List.find(params[:id])
      @list.update(list_params)
      redirect_to lists_path
  end

  def destroy
      list = List.find(params[:id])
      if list.destroy
        redirect_to lists_path
      else
        redirect_to lists_path
      end

  end

private
  def list_params
      params.require(:list).permit(:winename,
                                   :o_winename,
                                   :domaine,
                                   :o_domaine,
                                   :vintage,
                                   :category,
                                   :country,
                                   :aoc,
                                   :sepage,
                                   :r_price,
                                   :s_price,
                                   :region,
                                   :scene,
                                   :comment,
                                   :user_id,{
                                    listimages_attributes:[
                                      :id,
                                      :list_id,
                                      :image,
                                      :_destroy
                                      ]})
   end
end
