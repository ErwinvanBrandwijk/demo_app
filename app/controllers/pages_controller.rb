
class PagesController < ApplicationController
  def home
    @title = 'home'
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def contact
    @title = 'contact'
  end

  def about
    @title = 'about'
  end
end
