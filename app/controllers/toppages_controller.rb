class ToppagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
      @user = User.find(params[:id])
      @micropost = @user.microposts
      @likes = @user.likes.page(params[:page])
    end
  end
end