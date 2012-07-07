require 'test_helper'

class Route::RouteTest < MiniTest::Unit::TestCase
  def test_march
    r = Route::Route.new method: :get,
                         path: '/cars/:id',
                         controller: 'cars',
                         action: 'show'

    true_answer = r.match '/cars/1'
    false_answer = r.match '/animals/1'
    assert true_answer
    assert !false_answer
  end
end