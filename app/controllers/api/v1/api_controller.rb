class Api::V1::ApiController < ApplicationController
  before_action :get_user

  def get_current_user
    render json: @current_user
  end

  def get_user
    @current_user = User.find(2)
  end
end
