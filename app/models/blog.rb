class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :image, ImageUploader

  scope :active, -> { where(status: true) }
  
  validates_presence_of :title, :introduction, :description, :order, :status

  private

end
