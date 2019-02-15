module Placeholder
  extend ActiveSupport::Concern

  def image_generator(width:, height:)
    "https://via.placeholder.com/#{width}x#{height}"
  end
end