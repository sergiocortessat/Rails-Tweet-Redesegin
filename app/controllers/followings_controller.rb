class FollowingsController < ApplicationController
  def destroy_user
    @friendship = Following.find_by(followerid: params[:followedid])
    @friendship.destroy
    redirect_to user_path(params[:followerdid])
  end
end
