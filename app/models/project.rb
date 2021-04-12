class Project < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates_presence_of :title, :description, :order, :status, :project_type; :introduction

  scope :active, -> { where(status: true) }
  enum project_type: { website: 1, mobile_app: 2, educational: 3 }

  private


end
