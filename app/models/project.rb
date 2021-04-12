class Project < ApplicationRecord
  has_one_attached :image
  validates_presence_of :title, :description, :order, :status, :project_type; :introduction

  scope :active, -> { where(status: true) }
  enum project_type: { website: 1, mobile_app: 2, educational: 3 }

  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if image.attached? && !image.content_type.in?(%w(image/png image/jpg image/jpeg))
      errors.add(:image, 'Must be a Image file')
    end
  end
end
