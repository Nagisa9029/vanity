class Admins::UsersController < ApplicationController
#before_action :authenticate_admin!

  def index
    #@users = User.all.reverse_order
    @search_user = User.search(params[:q])
    @users = @search_user.result.reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_user_path(@user)
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :username,
                                 :nickname,
                                 :profile,
                                 :user_flg,
                                 :image,
                                 :bronze,
                                 :silver,
                                 :gold,
                                 :platinum
                                )
  end
end
