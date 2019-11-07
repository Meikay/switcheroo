class User < ApplicationRecord
    has_many :ratings
	has_many :items, through: :cart
	has_one :cart
	has_many :ratings, through: :item
        
    has_secure_password
end
