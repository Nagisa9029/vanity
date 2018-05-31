class GourmetcommentsController < ApplicationController

  def create
  	gourmet = Gourmet.find(params[:gourmet_id])
    gourmetcomment = current_user.gourmetcomments.new(gourmetcomment_params)
    gourmetcomment.gourmet_id = gourmet.id
    if gourmet.user_id == current_user.id
       gourmetcomment.read_flg = false
       gourmetcomment.save
    else
       gourmetcomment.read_flg = true
       gourmetcomment.save
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  private
  def gourmetcomment_params
  	params.require(:gourmetcomment).permit(:user_id,
  		                                   :gourmet_id,
  		                                   :g_comment,
                                         :read_flg)
  end
end
