module RailsAdminOrdering
  module Orderable
    extend ActiveSupport::Concern

    module ClassMethods
      
      def is_orderable?
        true
      end
      
      def acts_as_ordering(*options)
        has_one :orderable, :dependent => :destroy, :class_name => 'RailsAdminOrdering::ActsAsOrdering::Ordering', :as => :orderable
        default_scope joins(:orderable).order('orderings.position ASC')
        after_save :calculate_position
        delegate :position, to: :orderable
        class_eval do
          include RailsAdminOrdering::ActsAsOrdering::Core
          
          
          def calculate_position
            if self.orderable.nil?
              orderable = RailsAdminOrdering::ActsAsOrdering::Ordering.new
              orderable_count = RailsAdminOrdering::ActsAsOrdering::Ordering.where( :orderable_type => self.class.name ).count(:id)
              orderable.position = orderable_count + 1
              orderable.orderable = self
              orderable.save()
            end
          end
        end
      end
      
      
      def ordering
        self.joins(:orderable).order( ' orderings.position ASC ').all()
      end
      
      def ordering_asc
        self.ordering
      end
      
      def ordering_desc
        self.joins(:orderable).order( ' orderings.position DESC ').all()
      end
      
      def highest
        self.joins(:orderable).order( ' orderings.position DESC ').first
      end
      
      def lowest
        self.joins(:orderable).order( ' orderings.position ASC ').first
      end
      
      

      
    end
  end
end


ActiveRecord::Base.send :include, RailsAdminOrdering::Orderable