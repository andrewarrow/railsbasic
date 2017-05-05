class CompaniesController < ApplicationController

  def index
  end

  def new
  end

  def create
    c = Company.new
    c.name = params[:name]
    c.description = params[:description]
    c.creator_id = current_user.id
    if c.save
      flash[:notice] = 'Created.'
      redirect_to '/'
      return
    end
    flash[:notice] = 'Not able to create.'
    redirect_to '/'
  rescue Object => e
    flash[:notice] = 'Not able to create.'
    redirect_to '/'
  end

end
