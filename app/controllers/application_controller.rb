class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render :file => "#{Rails.root}/public/404.html", :layout => false, :status => 404
  end

  protected
  def current_ability
    if administrator_signed_in?
      Ability.new(current_administrator)
    elsif user_signed_in?
      Ability.new(current_user)
    else
      Ability.new(NonMember.new)
    end
  end
end
