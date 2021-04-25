# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # before_action :authenticate_user!



  # def detail
  #   @user = User.find_by(id: params[:id])
  # end


  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create

    @user = User.new(sign_up_params)
    # @user.save
    render :new and return if params[:back] 
    super
    # User.create(@user)
end


  # 新規追加

  # def confirm
  #   @user = User.new(user_params)
  #   render :new if @user.invalid?
  # end

  def confirm 
    @user = User.new(sign_up_params)
    if @user.valid? 
      render :action => 'confirm'
    else
     render :action => 'new'
    end
  end

  # def confirm
  #   i = 0
  #   @password = ""
  #   while i < @user.password.length
  #     @password += "*"
  #     i += 1
  #   end
  # end

  # def confirm
  #   @user = User.new(sign_up_params)
  #   if @user.invalid?
  #     flash.now[:danger] = '入力内容にエラーがあります。'
  #     render :new
  #     return
  #   end
  # end

  def complete
  end

  protected

  # アカウント登録後
  def after_sign_up_path_for(resource)
    users_sign_up_complete_path(resource)
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   "/user/#{current_user.id}"
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end


  def update_resource(resource, params)
    resource.update_without_password(params)
    # resource.update_without_current_password(params)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:password,:sex])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduce, :birthday])
  end 

  def after_update_path_for(resource)
    users_mypage_path(resource)
  end

end
