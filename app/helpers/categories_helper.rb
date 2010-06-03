module CategoriesHelper

  def category_tree_select(categories, model, name, selected=0, level=0, init=true, root=false, select_parent_id=false)
    html = ""
    # The "Root" option is added
    # so the user can choose a parent_id of 0
    if init
        # Add "Root" to the options
        html << "<select name=\"#{model}[#{name}]\" id=\"#{model}_#{name}\">\n"
        if root
          html << "\t<option value=\"\""
          html << " selected=\"selected\"" if selected && selected.parent_id == 0
          html << "></option>\n"
        end
    end

    if categories.length > 0
      level += 1 # keep position
      categories.collect do |cat|
        html << "\t<option value=\"#{cat.id}\" style=\"padding-left:#{level * 20}px\""
        
        html << ' selected="selected"' if  selected && select_parent_id && cat.id == selected.parent_id
        html << ' selected="selected"' if  selected && !select_parent_id && cat.id == selected.id

        html << ">#{cat.name}</option>\n"
        html << category_tree_select(cat.children, model, name, selected, level, false, false, select_parent_id)
      end
    end
    html << "</select>\n" if init
    return html
  end

  
  def category_tree_print(categories, html='', template='')
    if categories.length > 0
      html.concat( '<ul>' )
      for cat in categories
        unless (template.blank?)
          html.concat( render :partial => cat, :layout => template)
        else
          html.concat( render :partial => cat)
        end
        category_tree_print(cat.children, html, template) unless cat.children.blank?
      end
      html.concat( '</ul>' )
    end
    
    return html
  end

end
