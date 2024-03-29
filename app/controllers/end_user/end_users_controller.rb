class EndUser::EndUsersController < ApplicationController

  def index
    @end_users = EndUser.all
    @end_user = current_end_user
    @submission = Submission.new
  end

  def show
    @end_user = EndUser.find(params[:id])
    @submissions = @end_user.submissions
    @submission = Submission.new
  end

  def edit
    @end_user = EndUser.find(params[:id])
    if @end_user == current_end_user
      render "edit"
    else
      redirect_to end_user_path(current_end_user)
    end
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
    redirect_to end_user_path(@end_user.id)
    else
     render :edit
    end
  end

  def favorites
    @end_user = EndUser.find_by(id: params[:id])
    @favorites = Favorite.where(end_user: @end_user.id)
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :profile_image, :introduction)
  end
end
