class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true
  validates :author, presence: true
  validates :category, presence: true
  validates :published_at, presence: true

  scope :by_published_date_desc, -> { order(published_at: :desc) }
end
