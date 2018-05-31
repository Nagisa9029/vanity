class Admins::ColumnsController < ApplicationController
#before_action :authenticate_admin!

  def index
    #@columns = Column.all.reverse_order
    @columns = @search_column.result.reverse_order
  end

  def show
    @column = Column.find(params[:id])
    @columnimages = Columnimage.where(column_id: params[:id])
  end

  def destroy
      @column = Column.find(params[:id])
      @column.destroy
      redirect_to admins_columns_path
  end

private
  def column_params
      params.require(:column).permit(:c_title,
                                     :c_body,
                                     :c_category,
                                     :user_id,{
                                      columnimages_attributes:[
                                      :id,
                                      :subtitle,
                                      :subbody,
                                      :column_id,
                                      :image,
                                      :_destroy
                                      ]})
   end
end

