class StoreGuitarsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    
    if params[:price].present?
      @guitars = @store.guitars.show_guitars_over_price(params[:price])
    elsif params[:sort] == "alphabetically"
      @guitars = @store.guitars.sort_by_name
    else
      @guitars = @store.guitars
    end
  end

  def new
    @store = Store.find(params[:store_id])
  end

  def create
    store = Store.find(params[:store_id])
    guitar = store.guitars.create(guitar_params)

    redirect_to "/stores/#{store.id}/guitars"
  end

private
  def guitar_params
    params.permit(:name, :used, :price)
  end
end