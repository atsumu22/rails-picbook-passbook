class Book < ApplicationRecord
  has_many :bookmarks
  has_many :logs
  has_many :users, through: :bookmarks
  has_many :users, through: :logs

  validates :name, presence: true
  validates :author, presence: true
  validates :published_at, presence: true
  validates :publisher, presence: true
  validates :original_price, presence: true, numericality: { only_integer: true }
end
