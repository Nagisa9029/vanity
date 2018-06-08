class CommonsController < ApplicationController

  def new
    @common = Common.new
  end

  def create
    @nouveaucommon = Common.new(common_params)
    @nouveaucommon.user_id = current_user.id
    if @nouveaucommon.save
       redirect_to common_path(id: @nouveaucommon.id)
    else
       redirect_to commons_path
       @commons = Common.all
       render :index
    end
  end

  def index
    @commons = Common.all.reverse_order
    #@search_common = Common.search(params[:q])
    #@commons = @search_common.result.reverse_order
  end

  def show
    @common = Common.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def common_params
    params.require(:common).permit(:common_title,
                                   :common_body,
                                   :common_category,
                                   :image)
  end
end
