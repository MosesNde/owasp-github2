 
     attr_reader :strategy,
                 :entity,
                 :errors
 
    def initialize(strategy:, errors: nil)
       super
 
       @strategy = strategy
       @entity = strategy.entity
       @errors = errors
     end
 
     def self.wrapper_key
      "share_modal_body"
     end
 
     private