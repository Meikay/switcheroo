class User < ApplicationRecord
	has_many :items, through: :cart 
	has_many :ratings, through: :item
	has_one :cart
	
	validates :username, :email, presence: true
    validates_uniqueness_of :username, :email, :case_sensitive => false
    has_secure_password #automatically takes care of passord validations
end
