class Merchant < ApplicationRecord
  has_many :order_item
end
