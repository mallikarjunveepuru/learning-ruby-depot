class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  skip_before_action :authorize

  def index
    session[:store_index_views_count] ||= 0
    session[:store_index_views_count] += 1
    @views_count = session[:store_index_views_count]
    if params[:set_locale]
        redirect_to store_url(locale: params[:set_locale])
    else
        @products = Product.order(:title)
    end
  end
end
