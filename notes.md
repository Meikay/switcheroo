Rails App

** Used Items Exchange Marketplace **
	** Barter App "Switcheroo" **

Look up items, rating on item-condition, and add them to my cart

QUESTIONS:


####### Models:

	User:  
	  - has_many :ratings
	  - has_many :items, through: :cart
	  - has_one :cart
	  - has_many :ratings, through: :item

	  - password_digest
	  - username (:string)
	  - email (:string)
	  - age (:integer)

	
	Rating:    (join table) ***join table joining users and items***
	  - belongs_to :user
      - belongs_to :item
	  - has_many :users, through: :item

	  - stars (:integer)
	  - item_id
	  - user_id


	Item:  
	  - belongs_to :cart
	  - has_many :ratings

	 (make its own model for item_image after active storage install) Then add macro >> -has_one_attached :image

	  - item_name (:string)	
	  - item_description (:text)
	  ?- item_image (:blob)
	  - user_id (:integer)	
	  - cart_id (:integer)



	Cart:  
	  - belongs_to :user
	  - has_many :items

	  - user_id (:integer)
	  
	  	
	  


##### Controllers

	- application_controller
	- users_controller
	- item_listings_controller
	- ratings_controller
	- carts_controller
	- sessions_controller


###### views

	- sessions/ 
		-login page
	- users/
		-Edit
		-New Sign up
		-Show page for logged in user
	- layouts/
	- carts/
		-Show page user's cart content
	- item_listings/
		-

    *********SPECS**********
 Using Ruby on Rails for the project

[/] Include at least one has_many relationship
Example of one has_many relationship (e.g. x has_many y; User has_many Posts)

[/] Include at least one belongs_to relationship
 Example of one belongs_to relationship (e.g. y belongs_to x; e.g. Post belongs_to User)

[/] Include at least two has_many through relationships
Example of one belongs_to relationship (e.g. x has_many z through y; e.g. User has_many Categories through Posts)

[/] Include at least one many-to-many relationship
Example of many to many relationship (e.g. x has_many y through z, y has_many x through z; (e.g. User has_many Categories through Posts, Categories has_many Users through Posts)

[/] The "through" part of the has_many through includes at least one user submittable
attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (think attribute_name e.g. post.title)

[] Include reasonable validations for simple model objects

[] list of model objects with validations e.g. User, Post, Category (see above)

[] Include a class level ActiveRecord scope method

[] model object & class method name and URL to see the working feature e.g. Category.most_posts URL: /categories/most_posts)

[/] Include signup

[/] Include login

[/] Include logout

[] Include third party signup/login

[/] Include nested resource show or index
 URL e.g. categories/3/posts

[] Include nested resource "new" form
URL e.g. categories/7/posts/new)

[] Include form display of validation errors

[] form URL e.g. /posts/new)

[] Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate