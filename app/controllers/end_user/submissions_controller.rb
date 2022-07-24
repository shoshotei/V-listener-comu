class EndUser::SubmissionsController < ApplicationController

  def index
    @submission = Submission.new
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
    @end_user = @submission.end_user
    @newsubmission = Submission.new
    @comment = Comment.new
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.end_user_id = current_end_user.id
    if@submission.save
    redirect_to submission_path(@submission)

    else
      @submissions = Submission.all
      @end_user = current_end_user.id
      render :index
    end
  end

  def edit
    @submission = Submission.find(params[:id])
    if @submission.end_user == current_end_user
     render "edit"
    else
     redirect_to submissions_path
    end
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
     redirect_to submission_path(@submission.id)
    else
     render :edit
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submissions_path
  end

  private

  def submission_params
    params.require(:submission).permit(:body, :image)
  end
end
