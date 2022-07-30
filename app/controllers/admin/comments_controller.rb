class Admin::CommentsController < ApplicationController

  def destroy
   Comment.find(params[:id]).destroy
   redirect_to admin_submission_path(params[:submission_id])
  end
end
