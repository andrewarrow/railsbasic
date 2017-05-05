class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to '/user'
      return
    end
  end

  def user
    @items = Company.where(creator_id: current_user.id).order('created_at desc').limit(100)
  end

end
