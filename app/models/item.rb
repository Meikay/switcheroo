class Item < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :user
  has_many :ratings, dependent: :destroy 
end
