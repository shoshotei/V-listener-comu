class EndUser::SubmissionsController < ApplicationController

  def index
    @submission = Submission.new
    @submissions = Submission.all

    @submissions = params[:tag_id].present? ? Tag.find(params[:tag_id]).submissions : Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
    @end_user = @submission.end_user
    @newsubmission = Submission.new
    @newsubmission.submission_tags.build
    @comment = Comment.new
  end

  def new
    @submission = Submission.new
  end

  def create
    tag_ids = params.dig(:submission, :submission_tags, :tag_ids).compact_blank
    @submission = current_end_user.submissions.build(submission_params)
    tag_ids.each do |tag_id|
      @submission.submission_tags.build(tag_id: tag_id)
    end
    
    if @submission.save
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
