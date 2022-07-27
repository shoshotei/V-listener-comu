class EndUser::SearchesController < ApplicationController
    before_action :authenticate_end_user!

  def search
    @range = params[:range]

    if @range == "EndUser"
      @end_users = EndUser.looks(params[:search], params[:word])
      render "end_user/end_users/index"
    else
      @submissions = Submission.looks(params[:search], params[:word])
      render "end_user/submissions/index"
    end
  end
end
