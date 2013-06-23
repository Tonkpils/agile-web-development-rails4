class StoreController < ApplicationController
  include StoreCounter
  before_action :count_visits, only: [:index]

  def index
    @products = Product.order(:title)
  end

end
