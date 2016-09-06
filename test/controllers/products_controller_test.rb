require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { backplate: @product.backplate, baseClock: @product.baseClock, boostClock: @product.boostClock, cooling: @product.cooling, designer: @product.designer, height: @product.height, imgurl: @product.imgurl, length: @product.length, manurl: @product.manurl, memClock: @product.memClock, model: @product.model, msrp: @product.msrp, name: @product.name, part: @product.part, ports: @product.ports, ports_detailed: @product.ports_detailed, power: @product.power, vram: @product.vram, warranty: @product.warranty, width: @product.width } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { backplate: @product.backplate, baseClock: @product.baseClock, boostClock: @product.boostClock, cooling: @product.cooling, designer: @product.designer, height: @product.height, imgurl: @product.imgurl, length: @product.length, manurl: @product.manurl, memClock: @product.memClock, model: @product.model, msrp: @product.msrp, name: @product.name, part: @product.part, ports: @product.ports, ports_detailed: @product.ports_detailed, power: @product.power, vram: @product.vram, warranty: @product.warranty, width: @product.width } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
