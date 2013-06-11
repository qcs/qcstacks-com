# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "middleman-sprockets"
  s.version = "3.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Reynolds"]
  s.date = "2012-12-27"
  s.description = "Sprockets support for Middleman"
  s.email = ["me@tdreyno.com"]
  s.homepage = "https://github.com/middleman/middleman-sprockets"
  s.require_paths = ["lib"]
  s.rubyforge_project = "middleman-sprockets"
  s.rubygems_version = "1.8.23"
  s.summary = "Sprockets support for Middleman"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<middleman-more>, [">= 3.0.1"])
      s.add_runtime_dependency(%q<sprockets>, ["< 2.5", "~> 2.1"])
      s.add_runtime_dependency(%q<sprockets-sass>, ["~> 0.9.0"])
    else
      s.add_dependency(%q<middleman-more>, [">= 3.0.1"])
      s.add_dependency(%q<sprockets>, ["< 2.5", "~> 2.1"])
      s.add_dependency(%q<sprockets-sass>, ["~> 0.9.0"])
    end
  else
    s.add_dependency(%q<middleman-more>, [">= 3.0.1"])
    s.add_dependency(%q<sprockets>, ["< 2.5", "~> 2.1"])
    s.add_dependency(%q<sprockets-sass>, ["~> 0.9.0"])
  end
end
