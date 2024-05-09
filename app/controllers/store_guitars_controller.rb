class StoreGuitarsController < ApplicationController
  def index
    @store = Store.find(params[:store_id])
    @guitars = @store.guitars
  end
end