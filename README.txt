caching_matcher
    by Wolfram Arnold; Mighyverse.com; WTA Consulting, Inc.
    http://github.com/mightyverse/caching_matcher

== DESCRIPTION:

An rspec custom matcher to assert Rails action and fragment caching.

== FEATURES/PROBLEMS:

* Assert fragment caching with custom keys
* Assert action caching by URL
* Works only with memcached backend
* There are unresolved issues with the :format URL parameter (.xml, .json, ...)

== SYNOPSIS:

In spec_helper.rb, add into the config block:

config.include(CachingMatcher)
config.before { ActionController::Base.cache_store.clear }

In RSpec Controller Tests:

lambda {
   get :index
}.should be_cached(controller, :action => 'index')

lambda {
    get :edit, :id => 5
}.should_not be_cached(controller, :action => 'edit', :id => 5)

lambda {
    delete :destroy, :id => 5
}.should expire(controller, :action => 'index')

should_not expire is also available.

== REQUIREMENTS:

* memcached backend

== INSTALL:

* gem install caching_matcher

== LICENSE:

Copyright (c) 2009-2010 Wolfram Arnold; Mightyverse, Inc.; WTA Consulting, Inc.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
