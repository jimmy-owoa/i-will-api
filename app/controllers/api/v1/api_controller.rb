class Api::V1::ApiController < ApplicationController
  before_action :get_user

  def get_current_user
    @current_user = User.find(2)

    data = {
      current_user: @current_user,
      tasks: @current_user.tasks.pluck(:id)
    }

    render json: data
  end

  def get_user
    @current_user = User.find(2)
  end
end
