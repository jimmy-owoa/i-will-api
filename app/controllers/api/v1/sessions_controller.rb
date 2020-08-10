class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_cookie, only: [:destroy, :me]

  def destroy
    user = current_user
    if user  
      cookies.delete(:jwt)
      render json: {status: 'OK', code: 200}
    else
      render json: {status: 'session not found', code: 404}
    end
  end

  def create
    legal_number = params["legal_number"]
    password = params["password"]

    if legal_number && password
      login_hash = User.handle_login(legal_number, password)
      if login_hash
        cookies.signed[:jwt] = {value:  login_hash[:auth_token], httponly: true}
        render json: {success: true, user: login_hash }
      else
        render json: {status: 'incorrect email or password', code: 422}  
      end
    else
      render json: {status: 'specify email address and password', code: 422}
    end
  end

  def me
    render json: { success: true, user: current_user }
  end
end
