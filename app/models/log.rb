class Log < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :book, uniqueness: { scope: :user }
  enum :status, { log: 0, bookmark: 1 }
end
