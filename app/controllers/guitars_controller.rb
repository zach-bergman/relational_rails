class GuitarsController < ApplicationController
  def index
    @guitars = Guitar.display_used_guitars
  end

  def new
    # @stores = Store.all
  end
  
  def create
    store = @stores.last
    guitar = store.guitars.create!(guitar_params)

    redirect_to "/guitars"
  end

  def show
    @guitar = Guitar.find(params[:id])
  end

  def edit
    @guitar = Guitar.find(params[:id])
  end

  def update
    guitar = Guitar.find(params[:id])
    guitar.update(guitar_params)

    redirect_to("/guitars/#{guitar.id}")
  end

  def destroy
    guitar = Guitar.find(params[:id])
    guitar.delete

    redirect_to "/guitars"
  end

private
  def guitar_params
    params.permit(:name, :used, :price)
  end
end