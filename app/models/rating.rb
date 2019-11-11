class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_many :users, through: :item  
end
