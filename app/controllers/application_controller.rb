class ApplicationController < ActionController::API
  include ActionController::Cookies

  def authenticate_cookie
    auth_header = request.headers["auth-token"]
    token = auth_header.split(" ").last rescue nil
    decoded_token = JsonWebToken.decode(token) rescue nil
    @current_user = User.find_by(id: decoded_token["user_id"]) rescue nil
    if @current_user then return true else render json: {status: 'unauthorized', code: 401} end
  end

  def current_user
    if @current_user.blank?
      return false
    else
      current_user = {
        name: @current_user.name,
        email: @current_user.email,
        legal_number: @current_user.legal_number,
        roles: @current_user.roles.pluck(:name)
      }
      return current_user
    end
  end
end