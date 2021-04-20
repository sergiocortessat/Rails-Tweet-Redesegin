class OpinionsController < ApplicationController
  before_action :authenticate_user!
  def index
    @opinion = Opinion.new
    @comments = Opinion.new
    @user = User.all
    @opinions = Opinion.order('created_at DESC')
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.build(opinions_params)
    if @opinion.save
      redirect_to root_path
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
