class HomeController < ApplicationController
  def index
    redirect_to account_path(current_user.account) if current_user
  end
end
