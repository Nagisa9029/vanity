class Admins::GourmetcommentsController < ApplicationController
#before_action :authenticate_admin!

  def destroy
    @gourmetcomment= Gourmetcomment.find_by(id: params[:id], gourmet_id: params[:gourmet_id], user_id: params[:user_id])
    @gourmetcomment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def gourmetcomment_params
  	params.require(:gourmetcomment).permit(:user_id,
  		                                     :gourmet_id,
  		                                     :g_comment,
                                           :read_flg)
  end
end
