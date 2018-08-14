class Vendor < ApplicationRecord
  has_many :receipts
  has_many :products
end
