class CompaniesController < ApplicationController

  def show
    @item = Company.where(slug: params[:id]).first
  end
  def edit
    @item = Company.where(slug: params[:id]).first
  end

  def index
    @items = Company.all.order('created_at desc').limit(100)
    @title = 'Companies'
  end

  def new
  end

  def update

    @item = Company.where(slug: params[:id]).first
    if @item.creator_id != current_user.id
      return
    end

    @item.update_attributes(name: params[:name], 
                            description: params[:description])
    if params[:logo]
      @item.logo = params[:logo]
      @item.save
    end

    flash[:notice] = 'Changes saved.'
    redirect_to '/companies/' + @item.slug + '/edit'
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
