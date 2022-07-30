class Admin::SubmissionsController < ApplicationController

 def index
   @submissions = Submission.all
 end

 def show
   @submission = Submission.find(params[:id])
   @end_user = @submission.end_user
 end

 def destroy
   @submission = Submission.find(params[:id])
   @submission.destroy
   redirect_to admin_submissions_path
 end

end
