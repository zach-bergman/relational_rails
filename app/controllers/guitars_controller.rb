class GuitarsController < ApplicationController
  def index
    @guitars = Guitar.display_used_guitars
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

  def guitar_params
    params.permit(:name, :used, :price)
  end
end