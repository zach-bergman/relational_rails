class GuitarsController < ApplicationController
  def index
    @guitars = Guitar.all
  end
end