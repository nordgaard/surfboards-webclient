class SurfboardsController < ApplicationController

  def show
    @surfboard = Surfboard.find(params[:id])
  end

  def index
    @surfboards = Surfboard.all
  end

  def new
  end

  def create
   @surfboard = Surfboard.create(name: params[:name], feet: params[:feet], inches: params[:inches], color: params[:color])
     redirect_to "/surfboards/#{@surfboard["id"]}"
  end

  def edit

  end

  def update

  end

  def destroy
    surfboard = Surfboard.find(params[:id])
    surfboard.destroy
  end

end
