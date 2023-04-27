class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookmarks, dependent: :destroy
  has_many :logs, dependent: :destroy
  has_many :books, through: :bookmarks, dependent: :destroy
  has_many :books, through: :logs, dependent: :destroy

  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :user_name, presence: true, length: { minimum: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
