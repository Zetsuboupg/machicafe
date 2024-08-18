# app/controllers/categories_controller.rb
class Public::CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end
end
