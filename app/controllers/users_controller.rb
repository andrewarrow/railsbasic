class UsersController < ApplicationController
  def index
  end
  def new
    set_flavor
  end

  def create
    set_flavor
    flash[:notice] = 'Check your email for password.'
    redirect_to '/sessions/new'
  end

  def set_flavor
    @flavor = 'a'
    @flavor = 'b' if params[:flavor] == 'b'
  end
end
