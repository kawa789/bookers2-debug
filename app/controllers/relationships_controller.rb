class RelationshipsController < ApplicationController

  before_action :set_user

  def create
    following = current_user.follow(@user)
    following.save
    redirect_to request.referer
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    redirect_to request.referer
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

end
