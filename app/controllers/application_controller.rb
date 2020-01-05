class ApplicationController < ActionController::Base
    
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_user_reviews = user.reviews.count
    @count_user_concerns = user.concerns.count
  end
end
