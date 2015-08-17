class HomePagesController < ApplicationController
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def contact
  end

  def sign_up
  end
end
