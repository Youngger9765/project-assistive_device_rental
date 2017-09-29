class ApiV1::AuthController < ApiController

  # required user login for logout action
  before_action :authenticate_user_from_token!, :except => [:login, :register, :reSendConfirmation,:sendResetPassword]
  before_action :authenticate_user!, :except => [:login, :register,:reSendConfirmation,:sendResetPassword]


  def register
    user = User.find_by_email( params[:email].downcase )

    if user
      render :json => {
        :error => "帳號已註冊"
      }, :status => 401

    elsif params[:email].blank?
      render :json => {
        :error => "Email空白"
      }, :status => 401

    elsif params[:password].blank? || params[:password].size < 8
      render :json => {
        :error => "密碼空白或少於8個字元"
      }, :status => 401

    elsif params[:confirmed_password] != params[:password]
      render :json => {
        :error => "新密碼及確認新密碼不一致"
      }, :status => 401


    else
      user = User.new
      email = params[:email].downcase
      password = params[:password]
      created_at = Time.now
      user.email = email
      user.password = password
      user.first_name = params[:first_name]
      user.last_name = params[:last_name]
      user.authentication_token = user.generate_authentication_token

      if user.save
        render :json => {
          :member => {
            "msg" => "註冊成功，並寄送確認信到註冊信箱",
            "auth_token" => user.authentication_token,
            "user_id" => user.id
          }
        }, :status => 200
      else
        if !user.errors[:email].blank?
          render :json => {
            :error =>  user.errors[:email][0]
          }, :status => 401
        else
          render :json => {
            :error =>  "註冊失敗"
          }, :status => 401
        end
      end
    end
  end

  def login
    success = false
    error_msg = nil

    if params[:email] || params[:password]
      user = User.find_by_email( params[:email] )

      if !user
        error_msg = "無此Email"

      elsif !user.confirmed_at
        error_msg = "此帳號尚未啟用，請確認您的信箱，並點擊啟用連結"

      elsif !user.valid_password?(params[:password])
        error_msg = "密碼有誤"
      end

      success = user && user.valid_password?(params[:password])
    end

    if success
      sign_in(user, store: false) if user

			render :json => {
				:message => "登入成功",
				:auth_token => user.authentication_token,
				:user => {
					:user_id => user.id,
	        :email => user.email,
	        :first_name => user.first_name,
	        :last_name => user.last_name,
				}
      }

    else
      render :json => {
      	:error => error_msg,
      }, :status => 401
    end

  end

  def logout
    if params[:auth_token].present?
      user = User.find_by_authentication_token( params[:auth_token] )
      user.generate_authentication_token
      user.save!

      sign_out(user) if user
    end



    render :json => { :message => "你已登出"}
  end

  def reSendConfirmation
    user = User.find_by(:email => params[:email])

 		if user
      if user.confirmed_at
        render :json => { :message => "Email 已認證成功，請嘗試重新登入"}
      else
        user.save!
        user.send_confirmation_instructions
        render :json => { :message => "確認信已發出至指定信箱!"}
      end

    else
      render :json => { :error => "無此Email"}, :status => 401
    end
  end

  def sendResetPassword
    user = User.find_by(:email => params[:email])

    if user
      if user.save
        user.send_reset_password_instructions
        render :json => { :message => "更改密碼確認信已發出至指定信箱"}
      end
    else
      render :json => { :error => "無此Email"}, :status => 401
    end
  end
end
