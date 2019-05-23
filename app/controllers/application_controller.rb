class ApplicationController < ActionController::Base
  #before_action :set_basic_auth
  before_action :set_basic_auth, if: :is_production?

  private

  def is_production?
    Rails.env.production?
  end

  # def set_basic_auth
  #   authenticate_or_request_with_http_basic do |name, password|
  #     name == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  #   end
  # end
  def set_basic_auth
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end