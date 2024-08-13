# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def index
    @likes = Like.all
  end

  def show
    @like = Like.find(params[:id])
  end

  def edit
    @like = Like.find(params[:id])
  end
end
