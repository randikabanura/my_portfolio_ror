class ResumeSkill < ApplicationRecord
  validates_presence_of :order, :title, :percentage
  scope :active, -> { where(status: true) }
  
  validates_numericality_of :percentage, less_than_or_equal_to: 100, greater_than_or_equal_to: 0
end
