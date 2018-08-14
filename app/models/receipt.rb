class Receipt < ApplicationRecord
  has_one :user
  has_many :line_items
end
