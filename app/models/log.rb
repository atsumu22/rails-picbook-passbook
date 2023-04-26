class Log < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :price, presence: true, numericality: { only_integer: true }
end
