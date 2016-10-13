class Purchaser < ApplicationRecord
  has_many :order_item
end
