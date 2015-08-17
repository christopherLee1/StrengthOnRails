class HomePagesController < ApplicationController
  def index
    @micropost = current_user.microposts.build if logged_in?
  end

  def about
  end

  def contact
  end

  def sign_up
  end
end
