class Route::Builder
  attr_reader :routes

  def initialize(&block)
    @routes = Route::Routes.new
    instance_eval &block
  end

  class << self
    def build(&block)
      builder = new &block
      builder.routes
    end
  end
end