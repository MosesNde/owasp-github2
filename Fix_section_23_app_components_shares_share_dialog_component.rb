     include OpTurbo::Streamable
     include OpPrimer::ComponentHelpers
 
    def initialize(strategy:, errors:)
       super
 
       @strategy = strategy
       @errors = errors
     end
 
     private
 
    attr_reader :strategy, :errors
   end
 end