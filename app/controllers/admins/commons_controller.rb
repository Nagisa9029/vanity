class Admins::CommonsController < ApplicationController
#before_action :authenticate_admin!

  def index
    #@books = Book.all.reverse_order
    @books = @search_book.result.reverse_order
  end

  def show
    @book = Book.find(params[:id])
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
