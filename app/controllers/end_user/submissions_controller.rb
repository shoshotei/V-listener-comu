class EndUser::SubmissionsController < ApplicationController

  def index
    @submission = Submission.new
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
    @end_user = @submission.end_user
    @newsubmission = Submission.new
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.end_user_id = current_end_user.id
    if@submission.save
    redirect_to public_submission_path(@submission)

    else
      @submissions = Submission.all
      @end_user = current_end_user.id
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def submission_params
    params.require(:submission).permit(:body)
  end
end
