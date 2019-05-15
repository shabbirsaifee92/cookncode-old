class Portfolio < ApplicationRecord
  has_many :technologies

  accepts_nested_attributes_for :technologies,
                                            allow_destroy: true,
                                            reject_if: lambda { |attrs| attrs['name'].blank? }

  validates :title, :subtitle, :body, presence: true

  has_one_attached :thumb_image
  has_one_attached :main_image

  scope :angular, -> { where(subtitle: 'Angular') }
  scope :by_position, -> { order('position') }

  private

  def self.update_positions(position_hash)
    position_hash.each do |_key, value|
      find(value[:id]).update(position: value[:position])
    end

  end
end
