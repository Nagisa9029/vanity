class BooksController < ApplicationController

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

  def sepage
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def book_params
    params.require(:book).permit(:word,
                                 :meaning,
                                 :body,
                                 :category,
                                 :image)
  end
end
