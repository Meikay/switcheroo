class Item < ApplicationRecord
  belongs_to :cart
  has_many :ratings  
end
