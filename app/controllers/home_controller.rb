class HomeController < ApplicationController
    before_action :set_notification
  def index
  
  end
  private
  def set_notification
      @notifications=Notification.where(user_id:current_user.id)
  end
end
