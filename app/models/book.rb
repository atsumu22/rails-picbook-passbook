class Book < ApplicationRecord
  has_many :bookmarks
  has_many :logs
end
