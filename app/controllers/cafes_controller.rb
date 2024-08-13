# app/controllers/cafes_controller.rb
class CafesController < ApplicationController
  def new
    @cafe = Cafe.new
  end

  def index
    @cafes = Cafe.all
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def edit
    @cafe = Cafe.find(params[:id])
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
