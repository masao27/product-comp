# -*- encoding: utf-8 -*-
# stub: yahoo-api 0.1.6 ruby lib

Gem::Specification.new do |s|
  s.name = "yahoo-api".freeze
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["shoprev".freeze]
  s.date = "2013-11-28"
  s.description = "Ruby Yahoo Japan Web API ( Shopping,Auction,News )".freeze
  s.email = ["admin@shoprev.net".freeze]
  s.homepage = "https://github.com/shoprev/yahoo-api".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Ruby Yahoo Japan Web API ( Shopping,Auction,News )".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, ["= 1.11.0"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<vcr>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, ["= 1.11.0"])
      s.add_dependency(%q<activesupport>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<vcr>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, ["= 1.11.0"])
    s.add_dependency(%q<activesupport>.freeze, [">= 0"])
  end
end
