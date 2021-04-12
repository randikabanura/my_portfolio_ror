class SiteDocument < ApplicationRecord
  has_one_attached :document

  validates_presence_of :slug, :name
  validates_uniqueness_of :slug
  validate :correct_document_mime_type

  scope :active, -> { where(status: true) }

  before_validation :set_slug

  private

  def set_slug
    self.slug = self.name.parameterize(separator: '_')
  end

  def correct_document_mime_type
    if document.attached? && document.content_type.in?(%w(application/pdf)) && slug == 'resume'
      return
    elsif document.attached? && slug == 'resume'
      errors.add(:document, 'Must be a PDF file')
    end

    if document.attached? && !document.content_type.in?(%w(image/png image/jpg image/jpeg))
      errors.add(:document, 'Must be a Image file')
    end
  end
end
