module Inatra
  class << self
    def routes(&block)
      @routes = {}
      instance_eval(&block)
    end

    def call(env)
      method = env['REQUEST_METHOD'].to_s.downcase
      path   = env['PATH_INFO'].to_s.downcase

      @routes[method][path].nil? ? [404, {}, 'Not Found'] : @routes[method][path].call
    end

    def method_missing(method, path, &block)
      method = method.to_s.downcase
      path   = path.to_s.downcase
      @routes[method] ||= @routes.store(method, {})
      @routes[method].store(path, block)
    end

    def respond_to_missing?(method, path)
      method = method.to_s.downcase
      path   = path.to_s.downcase
      @routes.include?(method) && @routes[method].include?(path) || super
    end
  end
end
