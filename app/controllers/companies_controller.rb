class CompaniesController < ApplicationController

  def show
    @item = Company.where(slug: params[:id]).first
  end

  def index
    @items = Company.all.order('created_at desc').limit(100)
  end

  def new
  end

  def create
    c = Company.new
    c.name = params[:name]
    c.description = params[:description]
    c.creator_id = current_user.id
    c.logo = params[:logo]
    if c.save
      flash[:notice] = 'Created.'
      redirect_to '/'
      return
    end
    flash[:notice] = ''+c.errors.inspect
    redirect_to '/'
  rescue ActiveRecord::RecordNotUnique
    flash[:notice] = 'Not able to create.'
    redirect_to '/'
  end

end
