class Testimonial < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  validates_presence_of :name, :designation, :content
  validates :facebook, :instagram, :linkedin, :github, url: { allow_blank: true }

  scope :active, -> { where(status: true) }

  after_create :set_slug

  def set_slug
    self.update_column(:slug, "#{self.name.parameterize.underscore}_#{self.id}")
  end
end
