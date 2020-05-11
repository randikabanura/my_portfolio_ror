class SocialLink < ApplicationRecord
  validates_presence_of :name, :icon_text, :link, :link_type, :order
  scope :active, -> { where(status: true) }

  enum link_type: { any: 1, profile: 2, footer: 3 }
end
