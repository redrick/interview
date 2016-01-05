module STISubclassesNotRoutable
  extend ActiveSupport::Concern

  included do

    model_name.class_eval do
     def route_key
      'users'
     end

     def singular_route_key
       'user'
     end

     def param_key
       'user'
     end
   end

  end

end
