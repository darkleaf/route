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

  def method_missing(m, *args, &block)

    puts '111111111'
    puts m.to_s

    @routes.each do |r|
      r.send m, *args, &block
    end
  end
end