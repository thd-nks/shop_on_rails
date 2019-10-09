class User < ApplicationRecord
  has_secure_password

  has_many :bins
  has_many  :item, through: :bins, dependent: :destroy
  validates :email, presence: true, uniqueness: true
end
