class Item < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :user
  has_many :ratings, dependent: :destroy 
  has_many :cart_items, dependent: :destroy
end
