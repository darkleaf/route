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
        new: { method: :get, path: "/#{controller}/new", helper: "new_#{controller.singularize}" },
        create: { method: :post, path: "/#{controller}", helper: "#{controller}" },
        edit: { method: :get, path: "/#{controller}/:id/edit", helper: "edit_#{controller.singularize}" },
        show: { method: :get, path: "/#{controller}/:id", helper: "#{controller.singularize}" },
        update: { method: :put, path: "/#{controller}/:id", helper: "#{controller.singularize}" },
        destroy: { method: :delete, path: "/#{controller}/:id", helper: "#{controller.singularize}" },
        index: { method: :get, path: "/#{controller}", helper: "#{controller}" }
    }

    actions.each_pair do |k, v|
      args = v.merge action: k, controller: controller

      r = Route::Route.new args
      @routes.set_route r
    end
  end
end