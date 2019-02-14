class Portfolio < ApplicationRecord
  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true

  scope :angular, -> { where(subtitle: 'Angular') }
end
