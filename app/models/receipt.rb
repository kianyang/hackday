class Receipt < ApplicationRecord
  has_many :line_items
end
