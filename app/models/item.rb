class Item < ApplicationRecord
  validates :name,  presence: true
  validates :price, :amount, presence: true,
                             numericality: { only_integer: true,
                                             greater_than_or_equal_to: 0 }
  has_many :bins
  has_many :user, through: :bins, dependent: :destroy
end
