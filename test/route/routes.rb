require 'test_helper'

class Route::RoutesTest < MiniTest::Unit::TestCase
  def setup
    @rs = Route::Builder.build do
      resources :cars
    end
  end
=begin

  def test_get_index_route
    route = @rs.get_route '/cars', :get

    assert_equal route.controller, 'cars'
    assert_equal route.action, :index
  end

  def test_get_new_route
    route = @rs.get_route '/cars/new', :get

    assert_equal route.action, :new
  end

  def test_get_show_route
    route = @rs.get_route '/cars/1', :get

    assert_equal route.action, :show
  end

  def test_get_edit_route
    route = @rs.get_route '/cars/1/edit', :get

    assert_equal route.action, :edit
  end

  def test_post_create_route
    route = @rs.get_route '/cars', :post

    assert_equal route.action, :create
  end

  def test_put_update_route
    route = @rs.get_route '/cars/1', :put

    assert_equal route.action, :update
  end


=end

  def test_helper_resources_path
    assert_equal @rs.cars_path, '/cars'
  end

  def test_helper_resource_path
    assert_equal @rs.car_path(1), '/cars/1'
  end
  def test_helper_new_resource_path
    assert_equal @rs.new_car_path, '/cars/new'
  end
  def test_helper_edit_resources_path
    assert_equal @rs.edit_car_path(1), '/cars/1/edit'
  end
end