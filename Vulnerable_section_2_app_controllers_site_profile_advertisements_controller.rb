 
   def index
     @advertisements = Advertisement.for_member(current_member).new_arrivals
   end
 
   def new