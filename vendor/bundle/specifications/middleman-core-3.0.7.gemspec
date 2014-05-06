# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "middleman-core"
  s.version = "3.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Reynolds", "Ben Hollis"]
  s.date = "2012-12-17"
  s.description = "A static site generator. Provides dozens of templating languages (Haml, Sass, Compass, Slim, CoffeeScript, and more). Makes minification, compression, cache busting, Yaml data (and more) an easy part of your development cycle."
  s.email = ["me@tdreyno.com", "ben@benhollis.net"]
  s.executables = ["middleman"]
  s.files = ["bin/middleman"]
  s.homepage = "http://middlemanapp.com"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Hand-crafted frontend development"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>, ["~> 1.1"])
      s.add_runtime_dependency(%q<rack>, ["~> 1.4.1"])
      s.add_runtime_dependency(%q<tilt>, ["~> 1.3.1"])
      s.add_runtime_dependency(%q<rack-test>, ["~> 0.6.1"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.15.4"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.2.6"])
      s.add_runtime_dependency(%q<listen>, ["~> 0.5.2"])
      s.add_runtime_dependency(%q<rb-fsevent>, ["~> 0.9.1"])
      s.add_runtime_dependency(%q<rb-inotify>, ["~> 0.8.8"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.1"])
      s.add_dependency(%q<rack>, ["~> 1.4.1"])
      s.add_dependency(%q<tilt>, ["~> 1.3.1"])
      s.add_dependency(%q<rack-test>, ["~> 0.6.1"])
      s.add_dependency(%q<thor>, ["~> 0.15.4"])
      s.add_dependency(%q<activesupport>, ["~> 3.2.6"])
      s.add_dependency(%q<listen>, ["~> 0.5.2"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9.1"])
      s.add_dependency(%q<rb-inotify>, ["~> 0.8.8"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.1"])
    s.add_dependency(%q<rack>, ["~> 1.4.1"])
    s.add_dependency(%q<tilt>, ["~> 1.3.1"])
    s.add_dependency(%q<rack-test>, ["~> 0.6.1"])
    s.add_dependency(%q<thor>, ["~> 0.15.4"])
    s.add_dependency(%q<activesupport>, ["~> 3.2.6"])
    s.add_dependency(%q<listen>, ["~> 0.5.2"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9.1"])
    s.add_dependency(%q<rb-inotify>, ["~> 0.8.8"])
  end
end
