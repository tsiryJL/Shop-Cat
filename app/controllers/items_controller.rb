class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def show
      @current_item = Item.find(params[:id])
  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
