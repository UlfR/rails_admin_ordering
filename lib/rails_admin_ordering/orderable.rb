module RailsAdminOrdering
  module Orderable
    extend ActiveSupport::Concern

    module ClassMethods
      
      def orderable?
        false
      end
      
      def acts_as_ordering(*options)
        has_one :orderable, :dependent => :destroy, :class_name => 'RailsAdminOrdering::ActsAsOrdering::Ordering', :as => :orderable
        class_eval do
          include RailsAdminOrdering::ActsAsOrdering::Core
        end
      end
      
      
      def ordering
        self.joins(:orderable).order( ' orderings.position ASC ').all()
      end
    end
  end
end


ActiveRecord::Base.send :include, RailsAdminOrdering::Orderable