class Book < ApplicationRecord
  has_many :logs
  has_many :users, through: :logs

  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end
