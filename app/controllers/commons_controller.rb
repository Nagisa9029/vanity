class CommonsController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    #@books = Book.all.reverse_order
    @books = @search_book.result.reverse_order
  end

  def show
    @book = Book.find(params[:id])
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
