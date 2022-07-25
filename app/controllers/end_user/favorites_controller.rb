class EndUser::FavoritesController < ApplicationController
  
  def create
    @submission = Submission.find(params[:submission_id])
    @favorite = current_end_user.favorites.new(submission_id: submission.id)
    @favorite.save
    redirect_to submission_path(@submission)
  end

  def destroy
    @submission = Submission.find(params[:submission_id])
    @favorite = current_end_user.favorites.find_by(submission_id: submission.id)
    @favorite.destroy
    redirect_to submission_path(@submission)
  end
end
