     end
     
     def click
      id = @browser.instruct(:click, @id)
      @browser.wait_for_result_or_ping(id)
     end
     
   end