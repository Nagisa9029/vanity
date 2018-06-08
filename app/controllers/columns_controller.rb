class ColumnsController < ApplicationController
before_action :authenticate_user!, only:[:new]
before_action :create_love, only:[:show]
  #def new
  #  @column = Column.new
  #end

  def create
    @nouveaucolumn = Column.new(column_params)
    @nouveaucolumn.user_id = current_user.id
    if  @nouveaucolumn.save
        columnimage = @nouveaucolumn.columnimages.build
        columnimage.save
        redirect_to column_path(@nouveaucolumn.id)
    else
        @user = Column.find(current_user.id)
        @columns = Column.all
        render :index
    end
  end

  def index
    #@columns = Column.all.reverse_order
    @columns = @search_column.result.reverse_order
    @columns = @columns.page(params[:page])
  end

  def show
    @column = Column.find(params[:id])
    @columnimages = Columnimage.where(column_id: params[:id])
  end

  def create_love
    if user_signed_in?
       column = Column.find(params[:id])
       if column.loved_by?(current_user)
       else
          @love = current_user.loves.new(column_id: column.id)
          @love.save
       end
    end

  end

  def edit
      @column = Column.find(params[:id])
  end

  def update
      @column = Column.find(params[:id])
      @column.update(column_params)
      redirect_to columns_path
  end

  def destroy
      @column = Column.find(params[:id])
      @column.destroy
      redirect_to columns_path
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

