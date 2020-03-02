class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:like_id])
    user=micropost.user
    current_user.like(micropost)
    flash[:success] = "お気に入りに追加しました"
    redirect_to user_path(user)
  end

  def destroy
    micropost = Micropost.find(params[:like_id])
    user=micropost.user
    current_user.unlike(micropost)
    flash[:success] = "お気に入りから削除しました"
    redirect_to user_path(user)
  end
end