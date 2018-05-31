class Admins::CommentsController < ApplicationController
#before_action :authenticate_admin!

  def destroy
  	@comment= Comment.find_by(id: params[:id], post_id: params[:post_id], user_id: params[:user_id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
  	params.require(:comment).permit(:user_id,
  		                            :post_id,
  		                            :post_comment,
                                    :read_flg)
  end
end
