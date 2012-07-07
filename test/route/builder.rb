require 'test_helper'

class Route::BuilderTest < MiniTest::Unit::TestCase
  def test_builder_return_routes_instance
    rs = Route::Builder.build do

    end

    assert_kind_of Route::Routes, rs
  end

end