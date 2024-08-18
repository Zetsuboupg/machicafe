class Public::HomesController < ApplicationController
  def about
  end

  def top
    @cafes = Cafe.all
    @reviews = Review.order(created_at: :desc).limit(10) # 新着レビューを取得
  end

end
