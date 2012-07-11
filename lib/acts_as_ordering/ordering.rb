module ActsAsOrdering
  class Ordering < ::ActiveRecord::Base
    atr_accessible :orderable_id,
                    :orderable_type,
                    :position
    
  
  end
end
