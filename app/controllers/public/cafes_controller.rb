# app/controllers/cafes_controller.rb
class Public::CafesController < ApplicationController
  def new
    @cafe = Cafe.new
  end

  def index
    @q = Cafe.ransack(params[:q])
    @cafes = @q.result
  end

  def show
    @cafe = Cafe.find(params[:id])
    @review = Review.new
  end

  def edit
    @cafe = Cafe.find(params[:id])
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      redirect_to @cafe
    else
      render :new
    end
  end

  def update
    @cafe = Cafe.find(params[:id])
    if @cafe.update(cafe_params)
      redirect_to @cafe
    else
      render :edit
    end
  end

  private

  def cafe_params
    params.require(:cafe).permit(:cafe_name, :address, :description, :category_id, :image)
  end
end
