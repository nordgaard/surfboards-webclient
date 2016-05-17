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
    @surfboard = Unirest.post("#{ENV['DOMAIN']}/surfboards.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], feet: params[:feet], inches: params[:inches], color: params[:color]}).body #.body is important, top part makes post reuest to  API, with passed parameters
    redirect_to "/surfboards/#{@surfboard['id']}"
  end

  def update
    @surfboard = Unirest.post("#{ENV['DOMAIN']}/surfboards/#{params[:id]}.json", headers: {"Accept" => "application/json"}, parameters: {name: params[:name], feet: params[:feet], inches: params[:inches]}).body  #.body is important
    redirect_to "/surfboards/#{@surfboard["id"]}"
  end

  def destroy
    
  end

end
