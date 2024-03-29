# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{google_search}
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sasa Brankovic"]
  s.date = %q{2010-11-21}
  s.email = %q{sasa@hakeraj.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "google_search.gemspec",
    "lib/google_search.rb",
    "lib/google_search/google_search.rb",
    "lib/google_search/google_search_error.rb",
    "spec/google_search_paginated_spec.rb",
    "spec/google_search_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/fox/google_search}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Tiny wrapper for Google Search API}
  s.test_files = [
    "spec/google_search_paginated_spec.rb",
    "spec/google_search_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.1.0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.1.0"])
      s.add_dependency(%q<json>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.1.0"])
    s.add_dependency(%q<json>, [">= 0"])
  end
end

