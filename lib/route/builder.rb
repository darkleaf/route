class Route::Builder
  attr_reader :routes

  class << self
    def build(&block)
      builder = new &block
      builder.routes
    end
  end

  def initialize(&block)
    @routes = Route::Routes.new
    instance_eval &block
  end

  private
  def resources(name)

  end
end