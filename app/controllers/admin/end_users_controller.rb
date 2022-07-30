class Admin::EndUsersController < ApplicationController

  def index
     @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
    @submissions = @end_user.submissions
  end
end
