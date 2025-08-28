       id
     end
     
    def await_ping(params = {}, &block)
      ping = PingMatch.new(params)
      @ping_callbacks << ping
      done = false
      ping.callback { done = true }
      while not done; sleep 0.1; end
     end
     
   private
       @controller.drop_browser(self)
     end
     
     def instruct_and_wait(*command)
       id = instruct(*command)
       wait_with_timeout(:result) { @results.has_key?(id) }