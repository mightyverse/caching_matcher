module CachingMatcher

  class MatcherBase
    # first argument: controller
    # second arg: either a path string or hash of url options
    def initialize(controller, path_arg)
      @controller = controller
      compute_cache_key(path_arg)
    end

    attr_reader :cache_key

    private

    def compute_cache_key(path_arg)
      case path_arg
        when String
          path = path_arg
        when Hash
          url_options = path_arg.merge(:controller => @controller.class.to_s.underscore.split(/_controller/).first)
          path = ActionController::Caching::Actions::ActionCachePath.path_for(@controller, url_options, true)
        else
          raise "Argument to be_cached and be_expired must be controller, followed by a path as string or URL hash"
      end
      @cache_key = @controller.fragment_cache_key(path)
    end

    protected

    def run_match(event_proc)
      @before = ActionController::Base.cache_store.exist?(@cache_key)
      event_proc.call
      @after = ActionController::Base.cache_store.exist?(@cache_key)
    end
  end

  def prime_cache(controller, url_options)
    mb = MatcherBase.new(controller, url_options)
    ActionController::Base.cache_store.write(mb.cache_key, "Some data")
  end

  def clear_cache(controller, url_options)
    mb = MatcherBase.new(controller, url_options)
    ActionController::Base.cache_store.delete(mb.cache_key)
  end

  class BeCachedMatcher < MatcherBase

    def matches?(event_proc)
      run_match(event_proc)
      !@before && @after
    end

    def failure_message_for_should
      if @before
        "Key: #{@cache_key} was cached before operation. Did you forget to call ActionController::Base.cache_store.clear in the before block?"
      elsif !@after
        "Key: #{@cache_key} was not cached after operation but should have been."
      end
    end

    def failure_message_for_should_not
      if @after
        "Key: #{@cache_key} was cached after operation but should not have been."
      end
    end
  end

  def be_cached(controller,url_options)
    BeCachedMatcher.new(controller,url_options)
  end

  class BeExpiredMatcher < MatcherBase
    def matches?(event_proc)
      run_match(event_proc)
      @before && !@after
    end
    def failure_message_for_should
      if !@before
        "Key: #{@cache_key} was not cached before operation but should have been.  Did you forget to prime the cache?"
      elsif @after
        "Key: #{@cache_key} was cached after operation but should not have been."
      end
    end

    def failure_message_for_should_not
      if @before
        "Key: #{@cache_key} was cached before operation but should not have been.  Did you forget to clear the cache in a before block?"
      elsif !@after
        "Key: #{@cache_key} was not cached after operation but should have been."
      end
    end
  end

  def be_expired(controller,url_options)
    BeExpiredMatcher.new(controller,url_options)
  end

end
