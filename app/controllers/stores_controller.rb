class StoresController < ApplicationController
  def index
    @stores = Store.sort_by_created_at
  end

  def new
  end

  def create
    store = Store.create!(store_params)

    redirect_to "/stores"
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    store = Store.find(params[:id])
    store.update(store_params)

    redirect_to "/stores/#{store.id}"
  end

  def store_params
    params.permit(:name, :ongoing_sale, :annual_revenue)
  end
end