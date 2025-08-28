     end
     
     def click
      @browser.instruct(:click, @id)
      @browser.await_ping
     end
     
   end