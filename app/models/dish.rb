class Dish < ActiveRecord::Base
#  attr_accessible :category_id, :name, :desc, :price, :available
  has_many :compositions, :dependent => :destroy
  belongs_to :category
  accepts_nested_attributes_for :compositions, :reject_if => lambda { |a| a[:quantity].empty? }, :allow_destroy => true  
end
