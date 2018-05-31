class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :search

  def search
  	@search_book = Book.search(params[:q])
  	@search_post = Post.search(params[:q])
  	@search_gourmet = Gourmet.search(params[:q])
  	@search_column = Column.search(params[:q])
  end
end
