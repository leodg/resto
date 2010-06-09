class Category < ActiveRecord::Base
  attr_accessible :parent_id, :name
  acts_as_tree

  def self.find_no_parent
    find(:all,  :conditions => "parent_id is null")
  end

end
