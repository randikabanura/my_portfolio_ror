class SiteDocument < ApplicationRecord
  has_one_attached :document

  validates_presence_of :slug
  validates_uniqueness_of :slug
  scope :active, -> { where(status: true) }
  
  validate :correct_document_mime_type

  private

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
