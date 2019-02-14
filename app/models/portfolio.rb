class Portfolio < ApplicationRecord
  presnece :title, :subtitle, :body, :main_image, :thumb_image, presence: true
end
