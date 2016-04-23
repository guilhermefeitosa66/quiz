class Question < ActiveRecord::Base
  include Bootsy::Container
  
  belongs_to :quiz
  has_many :choices

  accepts_nested_attributes_for :choices
end
