class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  # before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token

  def current_user
    User.first.decorate.object
    # UserDecorator.decorate(super) if super
  end
end
