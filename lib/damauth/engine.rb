module Damauth
  class Engine < ::Rails::Engine
    isolate_namespace Damauth

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: false,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: false
      g.factory_girl false
      g.stylesheets = false
      g.javascripts = false
      g.helper = false
      g.javascript_engine :js
    end
  end
end
