class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum status: { draft:0, published: 1 }
  validates :title, :body, presence: true
  belongs_to :topic
end
