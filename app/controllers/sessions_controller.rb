class SessionsController < ApplicationController
  def new
    @forgot = params[:forgot].to_i
  end

  def create
    if params[:forgot].to_i == 1
      flash[:notice] = 'Email sent.'
      redirect_to '/'
      return
    end

    session[:user_id] = 1
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
