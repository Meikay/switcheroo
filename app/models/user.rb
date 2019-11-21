class User < ApplicationRecord
	has_secure_password
	has_one :cart
	has_many :items
	has_many :cart_items, through: :cart, class_name: "Item"
	has_many :ratings
	has_many :rated_users, through: :rating, class_name: "User"
	has_many :rated_items, through: :rating, class_name: "Item"
	
	validates :username, :email, presence: true
    validates_uniqueness_of :username, :email, :case_sensitive => false
     #automatically takes care of passord validations
end
