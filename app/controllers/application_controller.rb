class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ログイン済ユーザーのみにアクセスを許可する
  # before_action :authenticate_user!
  before_action:set_current_user

    # deviseコントローラーにストロングパラメータを追加する          
    before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :name, :password, ])
      devise_parameter_sanitizer.permit(:account_update, keys: [:introduce, :prefecture_id, :city, :hobby, :LikeType]) 
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :name, :password, :sex])
  end

  def after_sign_in_path_for(resource)
    # @current_user = User.find_by(id: session[:user_id])
    session[:user_id] = @user.id
    # root_path(resource)
    root_path
    # "/user/#{current_user.id}"
  end

  def set_current_user
    # @current_user = User.find_by(id: session[:user_id])
    @current_user = User.find_by(id: session[:user_id])

  end

end
