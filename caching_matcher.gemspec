# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{caching_matcher}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wolfram Arnold"]
  s.date = %q{2010-09-08}
  s.description = %q{An rspec custom matcher to assert Rails action and fragment caching.}
  s.email = %q{wolfram@rubyfocus.biz}
  s.extra_rdoc_files = ["History.txt", "README.txt", "version.txt"]
  s.files = ["History.txt", "README.txt", "Rakefile", "lib/caching_matcher.rb", "lib/caching_matcher/caching_matcher.rb", "spec/controllers/caching_matcher_spec.rb", "spec/mock_app/app/controllers/application_controller.rb", "spec/mock_app/app/controllers/items_controller.rb", "spec/mock_app/config/boot.rb", "spec/mock_app/config/environment.rb", "spec/mock_app/config/environments/test.rb", "spec/mock_app/config/initializers/cookie_verification_secret.rb", "spec/mock_app/config/initializers/mime_types.rb", "spec/mock_app/config/initializers/new_rails_defaults.rb", "spec/mock_app/config/initializers/session_store.rb", "spec/mock_app/config/locales/en.yml", "spec/mock_app/config/routes.rb", "spec/mock_app/log/test.log", "spec/spec_helper.rb", "test/test_caching_matcher.rb", "version.txt"]
  s.homepage = %q{http://github.com/mightyverse/caching_matcher}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{caching_matcher}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{An rspec custom matcher to assert Rails action and fragment caching}
  s.test_files = ["test/test_caching_matcher.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, [">= 2.3.8"])
      s.add_development_dependency(%q<activesupport>, [">= 2.3.8"])
      s.add_development_dependency(%q<actionpack>, [">= 2.3.8"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 1.3.2"])
      s.add_development_dependency(%q<bones>, [">= 3.4.7"])
    else
      s.add_dependency(%q<rails>, [">= 2.3.8"])
      s.add_dependency(%q<activesupport>, [">= 2.3.8"])
      s.add_dependency(%q<actionpack>, [">= 2.3.8"])
      s.add_dependency(%q<rspec>, [">= 1.3.0"])
      s.add_dependency(%q<rspec-rails>, [">= 1.3.2"])
      s.add_dependency(%q<bones>, [">= 3.4.7"])
    end
  else
    s.add_dependency(%q<rails>, [">= 2.3.8"])
    s.add_dependency(%q<activesupport>, [">= 2.3.8"])
    s.add_dependency(%q<actionpack>, [">= 2.3.8"])
    s.add_dependency(%q<rspec>, [">= 1.3.0"])
    s.add_dependency(%q<rspec-rails>, [">= 1.3.2"])
    s.add_dependency(%q<bones>, [">= 3.4.7"])
  end
end
