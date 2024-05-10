class StoresController < ApplicationController
  def index
    @stores = Store.sort_by_created_at
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
  end

  def create
  end
end