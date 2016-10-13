class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant
end
