class Api::V1::ApiController < ApplicationController
  before_action :authenticate_cookie
end
