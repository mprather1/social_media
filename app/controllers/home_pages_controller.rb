class HomePagesController < ApplicationController

#  layout 'default'

  before_action :confirm_logged_in

  def home
  end

  def test_page
    @users = User.all
    @pages = Page.all
  end
end
