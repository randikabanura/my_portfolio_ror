class SiteImage < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates_presence_of :slug, :name
  validates_uniqueness_of :slug

  scope :active, -> { where(status: true) }

  before_validation :set_slug

  private

  def set_slug
    self.slug = self.name.parameterize(separator: '_')
  end
end
