class StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def new
  end

  def create
  end
end