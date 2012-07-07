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
    controller = name.to_s

    actions = {
        new: { method: :get, path: "/#{controller}/new" },
        create: { method: :post, path: "/#{controller}" },
        edit: { method: :get, path: "/#{controller}/:id/edit" },
        show: { method: :get, path: "/#{controller}/:id" },
        update: { method: :put, path: "/#{controller}/:id" },
        destroy: { method: :delete, path: "/#{controller}/:id" },
        index: { method: :get, path: "/#{controller}" }
    }

    actions.each_pair do |k, v|
      args = v.merge action: k, controller: controller

      r = Route::Route.new args
      @routes.set_route r
    end
  end
end