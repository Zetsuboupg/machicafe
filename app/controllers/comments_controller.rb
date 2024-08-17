class CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to cafe_path(@review.cafe), notice: "コメントを投稿しました。"
    else
      redirect_to cafe_path(@review.cafe), alert: "コメントの投稿に失敗しました。"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content)
  end
end