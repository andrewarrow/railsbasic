class SessionsController < ApplicationController
  def new
  end
  def create
    session[:user_id] = 1
    redirect_to '/'
  end
end
