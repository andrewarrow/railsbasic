class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to '/user'
      return
    end

    render layout: 'welcome'
  end

  def user
    @items = Company.where(creator_id: current_user.id).order('created_at desc').limit(100)
    @title = 'Hello'
    render layout: 'application'
  end

end
