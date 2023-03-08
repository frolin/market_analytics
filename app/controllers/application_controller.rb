class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_user
    UserDecorator.decorate(super) if super
  end
end
