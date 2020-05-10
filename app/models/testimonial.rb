class Testimonial < ApplicationRecord
  validates_presence_of :name, :project, :designation, :content
  
  after_save :set_slug
  
  def set_slug
    self.update_column(:slug, "#{self.name.parameterize.underscore}_#{self.id}")
  end
end
