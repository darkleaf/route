class Route::Routes
  def initialize
    @routes = []
  end

  def get_route(path, method = :get)
    @routes.detect { |r| r.match(path, method) }
  end

  def set_route(route)
    @routes << route
  end
end