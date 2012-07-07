class Route::Route
  attr_reader :method, :path, :controller, :action

  def initialize(attributes)
    @method = attributes[:method]
    @path = attributes[:path]
    @controller = attributes[:controller]
    @action = attributes[:action]
    @path_regexp = Regexp.new(@path.gsub ':id', "[-\\w]+")
  end

  def match(path, method = :get)
    method == self.method && path =~ @path_regexp
  end
end