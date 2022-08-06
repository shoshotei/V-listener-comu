class EndUser::GuestsController < ApplicationController

  def new_guest
   end_user = EndUser.find_or_create_by!(email: 'guest@example.com') do |end_user|
     end_user.password = SecureRandom.urlsafe_base64
     end_user.name = "ゲストユーザー"
     end_user.introduction = "お試しログインです"
     # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
   end
   sign_in end_user
   redirect_to submissions_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
