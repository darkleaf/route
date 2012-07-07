class Route::Route
  attr_reader :method, :path, :controller, :action, :helper

  def initialize(attributes)
    @method = attributes[:method]
    @path = attributes[:path]
    @controller = attributes[:controller]
    @action = attributes[:action]
    @helper = attributes[:helper]
    @path_regexp = Regexp.new(@path.gsub ':id', "[-\\w]+")

    puts "#{self.helper}_path"


    define_singleton_method :"#{self.helper}_path" do |id|
      self.path.sub ':id', id
    end

    define_singleton_method :"#{self.helper}_path" do
      self.path
    end

  end

  def match(path, method = :get)
    method == self.method && path =~ @path_regexp
  end

  private
  def with_id?
    self.path =~ /:id/
  end
end