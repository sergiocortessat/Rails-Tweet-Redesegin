class OpinionsController < ApplicationController
  def index
    @opinions = current_user.opinions
    @opinion = Opinion.new
    @opinions = Opinion.order('DESC')
    @comments = Opinion.new
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
      redirect_to @opinion
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
