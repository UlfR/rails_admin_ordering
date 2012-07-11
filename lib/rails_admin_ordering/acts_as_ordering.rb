module RailsAdminOrdering
  module ActsAsOrdering
    extend ActiveSupport::Concern

    included do
    end
    module ClassMethods
      def acts_as_ordering(options = {})
        cattr_accessor :position
      end
    end
  end
end


ActiveRecord::Base.send :include, RailsAdminOrdering::ActsAsOrdering