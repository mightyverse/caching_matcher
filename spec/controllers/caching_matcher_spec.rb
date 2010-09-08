require File.join(File.dirname(__FILE__), %w[.. spec_helper])

describe CachingMatcher do
  controller_name :items

  context "Caching Assertions" do
    it 'reports cached' do
      lambda {
        get :index
      }.should be_cached(controller, :action => 'index')
    end

    it 'reports uncached' do
      lambda {
        get :edit, :id => 5
      }.should_not be_cached(controller, :action => 'edit', :id => 5)
    end
  end

  context "Expiry Assertions" do
    it 'reports expired' do
      prime_cache(controller, :action => 'index')
      lambda {
        delete :destroy, :id => 5
      }.should be_expired(controller, :action => 'index')
    end

    it 'reports unexpired' do
      prime_cache(controller, :action => 'index')
      lambda {
        delete :edit, :id => 5
      }.should_not be_expired(controller, :action => 'index')
    end
  end

  context "Helpers" do
    it 'can prime the cache programmatically with url hash' do
      lambda {
        prime_cache(controller, :action => 'index')
      }.should be_cached(controller, :action => 'index')
    end

    it 'can prime the cache programmatically with path' do
      lambda {
        prime_cache(controller, 'hello_world')
      }.should be_cached(controller, 'hello_world')
    end

    it 'can clear the cache programmatically with url hash' do
      prime_cache(controller, :action => 'index')
      lambda {
        clear_cache(controller, :action => 'index')
      }.should be_expired(controller, :action => 'index')
    end

    it 'can clear the cache programmatically with path' do
      prime_cache(controller, 'hello_world')
      lambda {
        clear_cache(controller, 'hello_world')
      }.should be_expired(controller, 'hello_world')
    end
  end
end

