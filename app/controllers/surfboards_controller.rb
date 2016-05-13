class SurfboardsController < ApplicationController

  def show
    @surfboard =  Unirest.get("http://localhost:3000/api/v1/surfboards/#{params[:id]}.json").body
    puts @surfboard
  end

  def index
    @surfboards = Unirest.get("http://localhost:3000/api/v1/surfboards.json").body
  end

  def new
  end

  def create
    @surfboard = Unirest.post ("#{(ENV['DOMAIN'])}/surfboards.json", headers: {:"Accept" => "application/json"}, parameters: {name: params[:name], feet: params[:feet], inches: params[:inches]}).body
    redirect_to "/surfboards/#{@surfboard["id"]}"
  end

end
