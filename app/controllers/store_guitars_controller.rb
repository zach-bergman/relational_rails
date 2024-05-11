class StoreGuitarsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    @guitars = @store.guitars
  end

  def new
    @store = Store.find(params[:store_id])
  end

  def create
    store = Store.find(params[:store_id])
    guitar = store.guitars.create!(guitar_params)

    redirect_to "/stores/#{store.id}/guitars"
  end

  def guitar_params
    params.permit(:name, :used, :price)
  end
end