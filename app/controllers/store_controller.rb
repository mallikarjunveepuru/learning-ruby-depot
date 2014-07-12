class StoreController < ApplicationController
  def index
    session[:store_index_views_count] ||= 0
    session[:store_index_views_count] += 1
    @views_count = session[:store_index_views_count]
    @products = Product.order(:title)
  end
end