class Rba::UsersController < ApplicationController
  def index
    @items = User.all.order(:id).limit(1000)
  end
end
