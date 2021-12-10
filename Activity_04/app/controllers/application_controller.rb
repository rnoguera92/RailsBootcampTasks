# frozen_string_literal: true

# base controller class
class ApplicationController < ActionController::API
  before_action :authenticate_user!
end
