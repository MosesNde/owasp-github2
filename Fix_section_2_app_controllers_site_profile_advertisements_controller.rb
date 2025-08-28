 
   def index
     @advertisements = Advertisement.for_member(current_member).new_arrivals
    respond_to do |format|
      format.js
    end
   end
 
   def new