# app/controllers/reviews_controller.rb
class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @cafe = @review.cafe
  end

  def edit
    @review = Review.find(params[:id])
  end

  def create
    @cafe = Cafe.find(params[:cafe_id])
    @review = @cafe.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @cafe, notice: 'レビューが作成されました。'
    else
      redirect_to @cafe, alert: 'レビューの作成に失敗しました。'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end


end
