require "rails_admin_ordering/engine"
require "rails_admin_ordering/orderable"

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
           bindings[:object].is_a? RailsAdminOrdering
         end
         
         register_instance_option :http_methods do
           [:get]
         end
         

         register_instance_option :controller do
           Proc.new do
              @obj = @abstract_model.model.where( "position < #{@object.position}" ).order(' position desc ').first

              if !@obj.nil?
                ord_up = @obj.position
                ord_down = @object.position
                @object.position = ord_up.to_i
                @obj.position = ord_down.to_i
            
                @object.save()
                @obj.save()
            
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
            bindings[:object].is_a? RailsAdminOrdering
          end

          register_instance_option :http_methods do
            [:get]
          end


          register_instance_option :controller do
            Proc.new do
              @obj = @abstract_model.model.where( "position > #{@object.position}" ).order(' position asc ').first
              if !@obj.nil?
                ord_up = @obj.position
                ord_down = @object.position
                @object.position = ord_up.to_i

                @obj.position = ord_down.to_i

                @object.save()
                @obj.save()
              end
              flash[:notice] = "You have moved #{@object.title} #{params[:go]}."

              redirect_to back_or_index
            end
          end
        end
       
       
     end
   end
 end
 


