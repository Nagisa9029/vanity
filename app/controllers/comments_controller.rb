class CommentsController < ApplicationController

  def create
  	post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    if post.user_id == current_user.id
       comment.read_flg = false
       comment.save
    else
       comment.read_flg = true
       comment.save
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  private
  def comment_params
  	params.require(:comment).permit(:user_id,
  		                              :post_id,
  		                              :post_comment,
                                    :read_flg)
  end
end
