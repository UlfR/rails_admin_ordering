module ActsAsOrdering
  module Core
    extend ActiveSupport::Concern
    
    included do
      class_eval do
        attr_writer :custom_contexts
      end
    end
    
    module ClassMethods
      def custom_contexts
        @custom_contexts ||= []
      end
    end
    
  end
end