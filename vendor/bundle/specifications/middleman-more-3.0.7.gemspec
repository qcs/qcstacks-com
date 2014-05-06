# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "middleman-more"
  s.version = "3.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Reynolds", "Ben Hollis"]
  s.date = "2012-12-17"
  s.description = "A static site generator. Provides dozens of templating languages (Haml, Sass, Compass, Slim, CoffeeScript, and more). Makes minification, compression, cache busting, Yaml data (and more) an easy part of your development cycle."
  s.email = ["me@tdreyno.com", "ben@benhollis.net"]
  s.homepage = "http://middlemanapp.com"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Hand-crafted frontend development"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<middleman-core>, ["= 3.0.7"])
      s.add_runtime_dependency(%q<uglifier>, ["~> 1.2.6"])
      s.add_runtime_dependency(%q<haml>, [">= 3.1.6"])
      s.add_runtime_dependency(%q<sass>, [">= 3.1.20"])
      s.add_runtime_dependency(%q<compass>, [">= 0.12.2"])
      s.add_runtime_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_runtime_dependency(%q<coffee-script-source>, ["~> 1.3.3"])
      s.add_runtime_dependency(%q<execjs>, ["~> 1.4.0"])
      s.add_runtime_dependency(%q<maruku>, ["~> 0.6.0"])
      s.add_runtime_dependency(%q<i18n>, ["~> 0.6.0"])
      s.add_runtime_dependency(%q<padrino-helpers>, ["= 0.10.7"])
    else
      s.add_dependency(%q<middleman-core>, ["= 3.0.7"])
      s.add_dependency(%q<uglifier>, ["~> 1.2.6"])
      s.add_dependency(%q<haml>, [">= 3.1.6"])
      s.add_dependency(%q<sass>, [">= 3.1.20"])
      s.add_dependency(%q<compass>, [">= 0.12.2"])
      s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
      s.add_dependency(%q<coffee-script-source>, ["~> 1.3.3"])
      s.add_dependency(%q<execjs>, ["~> 1.4.0"])
      s.add_dependency(%q<maruku>, ["~> 0.6.0"])
      s.add_dependency(%q<i18n>, ["~> 0.6.0"])
      s.add_dependency(%q<padrino-helpers>, ["= 0.10.7"])
    end
  else
    s.add_dependency(%q<middleman-core>, ["= 3.0.7"])
    s.add_dependency(%q<uglifier>, ["~> 1.2.6"])
    s.add_dependency(%q<haml>, [">= 3.1.6"])
    s.add_dependency(%q<sass>, [">= 3.1.20"])
    s.add_dependency(%q<compass>, [">= 0.12.2"])
    s.add_dependency(%q<coffee-script>, ["~> 2.2.0"])
    s.add_dependency(%q<coffee-script-source>, ["~> 1.3.3"])
    s.add_dependency(%q<execjs>, ["~> 1.4.0"])
    s.add_dependency(%q<maruku>, ["~> 0.6.0"])
    s.add_dependency(%q<i18n>, ["~> 0.6.0"])
    s.add_dependency(%q<padrino-helpers>, ["= 0.10.7"])
  end
end
