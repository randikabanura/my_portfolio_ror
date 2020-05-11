class Blog < ApplicationRecord
  extend FriendlyId
  has_one_attached :image
  friendly_id :title, use: :slugged
  scope :active, -> { where(status: true) }
  
  validates_presence_of :title, :introduction, :description, :order, :status
  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if image.attached? && !image.content_type.in?(%w(image/png image/jpg image/jpeg))
      errors.add(:image, 'Must be a Image file')
    end
  end
end
