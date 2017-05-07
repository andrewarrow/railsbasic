class UsersController < ApplicationController
  def show
    @item = User.where(slug: params[:id]).first
  end
  def index
    @items = User.all.order(:id).limit(100)
  end
  def new
    set_flavor
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update_attributes(fname: params[:fname], lname: params[:lname])
    flash[:notice] = 'Changes saved.'
    redirect_to '/users/me/edit'
  end

  def create
    set_flavor
    u = User.new
    u.fname = params[:fname]
    u.lname = params[:lname]
    u.email = params[:email]
    u.flavor = @flavor
    u.password = User.ranpas
    if u.save
      ApplicationMailer.forgot(u, u.password).deliver
      flash[:notice] = 'Check your email for password.'
      redirect_to '/sessions/new'
      return
    end
    flash[:notice] = 'Not able to create account.'
    redirect_to '/'
  rescue ActiveRecord::RecordNotUnique
    flash[:notice] = 'Not able to create account.'
    redirect_to '/'
  end

  def set_flavor
    @flavor = 'a'
    @flavor = 'b' if params[:flavor] == 'b'
  end
end
