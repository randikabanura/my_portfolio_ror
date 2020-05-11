class ResumeItem < ApplicationRecord
  validates_presence_of :title, :start, :end, :item_type, :order
  scope :active, -> { where(status: true) }
  
  enum item_type: { education: 1, employment: 2 }
end
