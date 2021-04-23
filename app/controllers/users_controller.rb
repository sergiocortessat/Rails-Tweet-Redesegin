class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @opinions = Opinion.ordered_by_most_recent
    @user_followings = User.user_followers(params[:id], current_user.id)
    @photo = User.find(params[:id]).photo
    @followers_count = User.user_followers_count(params[:id], current_user.id)
    @followed_count = User.user_followed_count(params[:id], current_user.id)
    @opinions_count = @user.opinions.count
  end

  def update_img
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_back(fallback_location: users_path(current_user))
      return
    end
    image = params[:user][:photo] unless params[:user].nil?
    if image
      @user.photo = image
      if @user.save
        flash[:success] = 'Image uploaded'
      else
        flash[:danger] = 'Image uploaded failed'
      end
    end
    redirect_back(fallback_location: root_path)
  end

  def follow_user
    user = User.find(params[:id])
    current_user.follow_user(params[:id])

    redirect_to user_path(params[:id])
    flash[:notice] = "You are now following #{user.fullname} / @#{user.username}"
  end
end
