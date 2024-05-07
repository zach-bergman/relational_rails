class StoresController < ApplicationController
  def index
    @stores = %w[store1 store2 store3]
  end
end