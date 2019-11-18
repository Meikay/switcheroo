class User < ApplicationRecord
	has_secure_password
	has_many :items, through: :cart 
	has_many :ratings, through: :item
	has_one :cart
	
	validates :username, :email, presence: true
    validates_uniqueness_of :username, :email, :case_sensitive => false
     #automatically takes care of passord validations
end
