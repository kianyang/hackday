class Reward < ApplicationRecord
  belongs_to :vendors
  belongs_to :users
end
