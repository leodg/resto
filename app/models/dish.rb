class Dish < ActiveRecord::Base
#  attr_accessible :category_id, :name, :desc, :price, :available
  has_many :compositions, :dependent => :destroy
  belongs_to :category
  accepts_nested_attributes_for :compositions, :reject_if => lambda { |a| a[:quantity].empty? }, :allow_destroy => true

  has_attached_file  :photo, :styles => { :small => "50x50>", :medium => "150x150>",  :normal => "400x400>" }

  def self.find_for_sale
    find(:all)
  end

end
