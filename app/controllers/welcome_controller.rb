class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to '/user'
      return
    end
  end
  def user
  end
end
