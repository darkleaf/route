require 'test_helper'

class Route::BuilderTest < MiniTest::Unit::TestCase
  def setup
    @rs = Route::Builder.build do
    end
  end

  def test_return_correct_class
    assert_kind_of Route::Routes, @rs
  end
end