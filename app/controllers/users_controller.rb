class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @opinions = Opinion.order('created_at DESC')
    @followers = User.user_followers(params[:id], current_user.id)
    @photo = User.find(params[:id]).photo
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
    current_user.follow_user(params[:id])
    redirect_to user_path(params[:id])
  end
end
