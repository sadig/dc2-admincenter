class Admin::MainController < ApplicationController
  before_filter :require_login
  before_filter :require_admin
  def index
  end
end
