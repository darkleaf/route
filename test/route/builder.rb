require 'test_helper'

class Route::BuilderTest < MiniTest::Unit::TestCase
  def test_a
    rs = Route::Builder.build

    assert_kind_of Route::Routes, rs
  end
end