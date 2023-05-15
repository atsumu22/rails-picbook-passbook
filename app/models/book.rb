class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :user_id, uniqueness: true
  validates :price, presence: true, numericality: { only_integer: true }
  enum :status, { log: 0, bookmark: 1 }
end
