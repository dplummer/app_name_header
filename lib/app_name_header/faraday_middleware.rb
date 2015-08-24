require 'faraday'

module AppNameHeader
  class FaradayMiddleware < ::Faraday::Middleware
    HEADER = "X-App-Name".freeze

    def self.default_name
      @default_name ||= Rails.application.class.name.split("::").first.underscore if defined?(Rails)
    end

    def initialize(app, options = nil)
      super(app)
      @options = default_options.merge(options || {})
    end

    def call(env)
      set_header(env) if needs_header?(env)
      @app.call(env)
    end

  private

    def needs_header?(env)
      @options[:name] && !env[:request_headers][@options[:header]]
    end

    def set_header(env)
      env[:request_headers][@options[:header]] = @options[:name]
    end

    def default_options
      { name: self.class.default_name, header: HEADER }
    end
  end
end
