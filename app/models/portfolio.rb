class Portfolio < ApplicationRecord
  has_many :technologies

  accepts_nested_attributes_for :technologies,
                                            reject_if: lambda { |attrs| attrs['name'].blank? }

  include Placeholder

  validates :title, :subtitle, :body, :main_image, :thumb_image, presence: true

  scope :angular, -> { where(subtitle: 'Angular') }

  after_initialize :set_defaults

  private

  def set_defaults
    self.main_image ||= image_generator(width: 600, height: 400)
    self.thumb_image ||= image_generator(width: 350, height: 200)
  end
end
