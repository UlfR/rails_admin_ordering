require "rails_admin_ordering/engine"
require "rails_admin_ordering/orderable"
require "rails_admin_ordering/acts_as_ordering/core"
require "rails_admin_ordering/acts_as_ordering/ordering"

module RailsAdminOrdering
end

require 'rails_admin/config/actions'

 module RailsAdmin
   module Config
     module Actions
       class Orderup < RailsAdmin::Config::Actions::Base
         # There are several options that you can set here.
        RailsAdmin::Config::Actions.register(self)
        
         register_instance_option :bulkable? do
           false
         end

         register_instance_option :link_icon do
           'icon-arrow-up'
         end
         
         register_instance_option :member do
           true
         end
         
         register_instance_option :visible? do
           bindings[:object].is_a? RailsAdminOrdering::Orderable
         end
         
         register_instance_option :http_methods do
           [:get]
         end
         

         register_instance_option :controller do
           Proc.new do
             @ord_obj = RailsAdminOrdering::ActsAsOrdering::Ordering.where( :orderable_type => @object.class.name ).where( "orderings.position < #{@object.orderable.position}" ).order(' orderings.position desc ').first
              

              if !@ord_obj.nil?
                @obj = @abstract_model.model.where( :id => @ord_obj.orderable_id).first
                @ord_object = @object.orderable
                ord_up = @obj.orderable.position
                ord_down = @ord_object.position
                @ord_object.position = ord_up.to_i
                @ord_obj.position = ord_down.to_i
            
                @ord_object.save()
                @ord_obj.save()
            
              end
             flash[:notice] = "You have moved #{@object.title} #{params[:go]}."

             redirect_to back_or_index
           end
         end
       end
       
       class Orderdown < RailsAdmin::Config::Actions::Base
          # There are several options that you can set here.
         RailsAdmin::Config::Actions.register(self)

          register_instance_option :bulkable? do
            false
          end

          register_instance_option :link_icon do
            'icon-arrow-down'
          end

          register_instance_option :member do
            true
          end

          register_instance_option :visible? do
            bindings[:object].is_a? RailsAdminOrdering::Orderable
          end

          register_instance_option :http_methods do
            [:get]
          end


          register_instance_option :controller do
            Proc.new do
              @obj = @abstract_model.model.joins(:orderable).where( "orderings.position > #{@object.orderable.position}" ).order(' orderings.position asc ').first
              if !@obj.nil?
                ord_up = @obj.orderable.position
                ord_down = @object.orderable.position
                @object.orderable.position = ord_up.to_i

                @obj.orderable.position = ord_down.to_i

                @object.orderable.save()
                @obj.orderable.save()
              end
              flash[:notice] = "You have moved #{@object.title} #{params[:go]}."

              redirect_to back_or_index
            end
          end
        end
       
       
     end
   end
 end
 


