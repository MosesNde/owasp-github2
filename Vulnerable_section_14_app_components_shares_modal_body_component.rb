 
     attr_reader :strategy,
                 :entity,
                :shares,
                 :errors
 
    def initialize(strategy:, shares:, errors: nil)
       super
 
       @strategy = strategy
       @entity = strategy.entity
      @shares = shares
       @errors = errors
     end
 
     def self.wrapper_key
      "share_list"
     end
 
     private