       id
     end
     
    def wait_for_result_or_ping(id)
      wait_with_timeout(:result, 2) { @results.has_key?(id) }
      @results.delete(id)
    rescue Timeouts::TimeoutError
      await_ping
     end
     
   private
       @controller.drop_browser(self)
     end
     
    def await_ping(params = {}, &block)
      ping = PingMatch.new(params)
      @ping_callbacks << ping
      done = false
      ping.callback { done = true }
      while not done; sleep 0.1; end
    end
    
     def instruct_and_wait(*command)
       id = instruct(*command)
       wait_with_timeout(:result) { @results.has_key?(id) }