class UsersController < ApplicationController
  def index
  end
  def new
    set_flavor
  end

  def create
    set_flavor
    u = User.new
    u.fname = params[:fname]
    u.lname = params[:lname]
    u.email = params[:email]
    u.password = User.ranpas
    if u.save
      flash[:notice] = 'Check your email for password.'
      redirect_to '/sessions/new'
      return
    end
    flash[:notice] = 'Not able to create account.'
    redirect_to '/'
  end

  def set_flavor
    @flavor = 'a'
    @flavor = 'b' if params[:flavor] == 'b'
  end
end
