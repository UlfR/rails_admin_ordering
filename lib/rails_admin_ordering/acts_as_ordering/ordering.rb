module RailsAdminOrdering
  module ActsAsOrdering
    class Ordering < ::ActiveRecord::Base
      # attr_accessible :orderable_id,
      #                 :orderable_type,
      #                 :position


      belongs_to :orderable, :polymorphic => true
    end
  end
end
