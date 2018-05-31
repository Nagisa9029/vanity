class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    #@users = User.all.reverse_order
    @search_user = User.search(params[:q])
    @users = @search_user.result.reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  #def destroy
  #end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
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
