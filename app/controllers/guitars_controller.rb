class GuitarsController < ApplicationController
  def index
    @guitars = Guitar.all
  end

  def show
    @guitar = Guitar.find(params[:id])
  end

  def edit
    @guitar = Guitar.find(params[:id])
  end
end