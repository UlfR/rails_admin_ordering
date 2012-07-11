module RailsAdminOrdering
  module Orderable
    extend ActiveSupport::Concern

    module ClassMethods
      
      def orderable?
        false
      end
      
      def acts_as_ordering(*options)
        has_many :orderablem :dependent => :destroy, :class_name => 'ActsAsOrdering::Ordering'
        class_eval do
          include ActsAsOrdering::Core
        end
      end
    end
  end
end


ActiveRecord::Base.send :include, RailsAdminOrdering::ActsAsOrdering