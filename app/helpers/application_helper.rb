# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

 def link_to_add_fields(name, f, association)   
   new_object = f.object.class.reflect_on_association(association).klass.new
   fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
     render(association.to_s.singularize + "_fields", :f => builder)
   end
   fields= fields + autocomplete_add
   link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
 end

 def autocomplete_add   
   return '<script type="text/javascript"> var obj = "dish_compositions_attributes_new_compositions_ingredient_name"; new Autocomplete(obj, { serviceUrl:"/ingredients/", minChars:2 });</script>'
 end

 def autocomplete_add_2
   return '<script type="text/javascript"> var obj = "dish_compositions_attributes_"+c+"_ingredient_name"; c++; new Autocomplete(obj, { serviceUrl:"/ingredients/", minChars:2 }  );</script>'
 end



 
end

