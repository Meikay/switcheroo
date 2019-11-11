class User < ApplicationRecord
	has_many :items, through: :cart 
	has_many :ratings, through: :item
	has_one :cart
	
	validates :username, presence: true
    validates_uniqueness_of :username, :case_sensitive => false
    has_secure_password
end
