class Bin < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item, :user, :amount, presence: true
end
