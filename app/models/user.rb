class User < ApplicationRecord
	has_secure_password
	has_many :items, through: :cart 
	# has_many :ratings, through: :item  Is this necessary?
	has_many :items, through: :rating
	has_one :cart
	has_many :items
	
	validates :username, :email, presence: true
    validates_uniqueness_of :username, :email, :case_sensitive => false
     #automatically takes care of passord validations
end
