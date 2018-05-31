class PostsController < ApplicationController
before_action :update_comment, only:[:show]
  #def new
  #end

  def create
      @nouveaupost = Post.new(post_params)
      @nouveaupost.user_id = current_user.id
      if  @nouveaupost.save
          postimage = @nouveaupost.postimages.build
          postimage.save
          redirect_to posts_path
      else
          @user = User.find(current_user.id)
          @posts = Post.all
          render :index
      end
  end

  def index
      #@posts = Post.all.reverse_order
      @posts = @search_post.result.reverse_order
      @comment = Comment.new
  end

  def follower
     followers = current_user.following
     @posts = Post.where(user_id: followers ).reverse_order
     @comment = Comment.new
  end

  def mycommit
      @posts = Post.where(user_id: current_user.id).reverse_order
      @comment = Comment.new
  end

  def show
      @post = Post.find(params[:id])
      @postimages = Postimage.where(post_id: params[:id])
      @comment = Comment.new
  end

  def update_comment
      if user_signed_in?
      post = Post.find(params[:id])
      @comments = Comment.where(post_id: post.id)
        if post.user_id == current_user.id
          @comments.each do |comment|
            @comment = comment
            @comment.read_flg = false
            @comment.save
          end
        end
      end
  end

  #def edit
  #end

  def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to posts_path
  end

  def destroy
      post = Post.find(params[:id])
      if post.destroy
        redirect_to posts_path
      else
        redirect_to posts_path
      end

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
