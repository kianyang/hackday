class Receipt < ApplicationRecord
  belongs_to :vendor
  has_one :user
  has_many :line_items
end
