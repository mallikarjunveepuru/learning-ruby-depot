require 'test_helper'

class CartTest < ActiveSupport::TestCase

  test "add unique products" do
    cart = Cart.create;
    cart.add_product(products(:ruby).id).save!
    cart.add_product(products(:coffee).id).save!

    assert_equal cart.line_items.size, 2
    assert_equal cart.total_price, 85.50
  end

  test "add duplicate products" do
    cart = Cart.create
    ruby_id = products(:ruby).id
    cart.add_product(ruby_id).save!
    cart.add_product(ruby_id).save!
    cart.add_product(ruby_id).save!

    assert_equal cart.line_items.size, 1
    assert_equal cart.total_price, 148.50
  end


end
