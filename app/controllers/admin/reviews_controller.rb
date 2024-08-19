class Admin::ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  # レビューの削除
  def destroy

    @review.destroy
    redirect_to admin_dashboards_path, notice: 'レビューが削除されました'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end
end