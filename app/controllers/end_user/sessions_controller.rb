# frozen_string_literal: true

class EndUser::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
    before_action :end_user_state, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
 def end_user_state
  ## 【処理内容1】 入力されたemailからアカウントを1件取得
  @end_user = EndUser.find_by(email: params[:end_user][:email])
  ## アカウントを取得できなかった場合、このメソッドを終了する
  return if !@end_user
  ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  if @end_user.valid_password?(params[:end_user][:password]) && (@end_user.is_deleted == true)
    ## 【処理内容3】
   redirect_to new_end_user_registration_path
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
 end
end
