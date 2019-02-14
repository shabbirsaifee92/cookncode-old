class Portfolio < ApplicationRecord
  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true

  scope :angular, -> { where(subtitle: 'Angular') }

  after_initialize :set_defaults

  private

  def set_defaults
    self.main_image ||= 'https://via.placeholder.com/600x400'
    self.thumb_image ||= 'https://via.placeholder.com/350x200'
  end
end
