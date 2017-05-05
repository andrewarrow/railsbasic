class SessionsController < ApplicationController
  def new
    @forgot = params[:forgot].to_i
  end

  def create
    u = User.where(email: params[:email]).first
    if params[:forgot].to_i == 1
      clear = User.ranpas
      u.update_attributes(password: clear)
      ApplicationMailer.forgot(u, clear).deliver
      flash[:notice] = 'Email sent.'
      redirect_to '/'
      return
    end

    unless u
      flash[:notice] = 'invalid'
      redirect_to '/sessions/new'
      return
    end

    session[:user_id] = u.id
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
