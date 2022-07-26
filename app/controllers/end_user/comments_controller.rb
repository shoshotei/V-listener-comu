class EndUser::CommentsController < ApplicationController
  def create
    @submission = Submission.find(params[:submission_id])
    @comment = current_end_user.comments.new(comment_params)
    @comment.submission_id = @submission.id
    @comment.save
    redirect_to submission_path(@submission.id)
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to submission_path(params[:submission_id])
  end
  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
