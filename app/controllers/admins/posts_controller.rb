class Admins::PostsController < ApplicationController
#before_action :authenticate_admin!

  def index
      #@posts = Post.all.reverse_order
      @posts = @search_post.result.reverse_order
  end

  def show
      @post = Post.find(params[:id])
      @postimages = Postimage.where(post_id: params[:id])
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to admins_posts_path
  end

private
  def post_params
      params.require(:post).permit(:p_title,
                                   :p_body,
                                   :p_category,
                                   :user_id,{
                                    postimages_attributes:[
                                      :id,
                                      :post_id,
                                      :image,
                                      :_destroy
                                      ]})
   end
end
