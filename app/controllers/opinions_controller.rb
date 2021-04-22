class OpinionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @opinion = Opinion.new
    @user = User.where.not(id: current_user.id).ordered_by_most_recent
    @opinions = Opinion.ordered_by_most_recent
    @followers_count = User.user_followers_count(params[:id], current_user.id)
    @followed_count = User.user_followed_count(params[:id], current_user.id)
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.build(opinions_params)
    if @opinion.save

      redirect_to root_path
      flash[:notice] = 'Post created'
    else
      render 'new'
    end
  end

  def destroy; end

  private

  def opinions_params
    params.require(:opinion).permit(:text)
  end
end
