class StoresController < ApplicationController
  def index
    if params[:sort] == "largest_inventory"
      @stores= Store.sort_by_largest_inventory
    else
      @stores = Store.sort_by_created_at
    end
  end

  def new
  end

  def create
    store = Store.create(store_params)

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

  def destroy
    store = Store.find(params[:id])
    guitars = store.guitars

    guitars.destroy_all
    store.destroy

    redirect_to "/stores"
  end
  
private
  def store_params
    params.permit(:name, :ongoing_sale, :annual_revenue)
  end
end