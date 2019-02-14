class Portfolio < ApplicationRecord
  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true

  include Placeholder
  scope :angular, -> { where(subtitle: 'Angular') }

  after_initialize :set_defaults

  private

  def set_defaults
    self.main_image ||= image_generator(width: 600, height: 400)
    self.thumb_image ||= image_generator(width: 350, height: 200)
  end
end
