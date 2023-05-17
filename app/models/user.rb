class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :books, dependent: :destroy

  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :user_name, presence: true, length: { minimum: 1 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
