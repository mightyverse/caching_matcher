
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'test:run'
task 'gem:release' => 'test:run'

Bones {
  name  'caching_matcher'
  authors  'Wolfram Arnold'
  email    'wolfram@rubyfocus.biz'
  url      'http://github.com/mightyverse/caching_matcher'
  ignore_file  '.gitignore'
  depend_on 'rails', :version => '2.3.8', :development => true
  depend_on 'activesupport', :version => '2.3.8', :development => true
  depend_on 'actionpack', :version => '2.3.8', :development => true
  depend_on 'rspec', :version => '>=1.3.0', :development => true
  depend_on 'rspec-rails', :version => '>=1.3.2', :development => true
}
