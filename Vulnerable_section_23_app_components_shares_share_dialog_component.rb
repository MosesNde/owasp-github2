     include OpTurbo::Streamable
     include OpPrimer::ComponentHelpers
 
    def initialize(shares:, strategy:, errors:)
       super
 
      @shares = shares
       @strategy = strategy
       @errors = errors
     end
 
     private
 
    attr_reader :shares, :strategy, :errors
   end
 end