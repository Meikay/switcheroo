# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Cart.destroy_all
Item.destroy_all
Rating.destroy_all

#User data
15.times do
    User.create!(
        username: Faker::Name.unique.name,
        email: Faker::Internet.free_email, 
        password: Faker::Internet.password,
        age: Faker::Number.within(range: 18..40)
    )
end   

p "#{User.count} users created"

#Cart data
15.times do    
    Cart.create!(
        user_id: Faker::Number.between(from: User.first.id, to: User.last.id)
    )
end

p "#{Cart.count} carts created"

#Item data
15.times do 
    Item.create!(
        item_name: Faker::Commerce.product_name,
        item_description: Faker::Hipster.paragraph,
        user_id: Faker::Number.between(from: User.first.id, to: User.last.id),
        cart_id: Faker::Number.between(from: Cart.first.id, to: Cart.last.id) 
    )
end

p "#{Item.count} items created"
#Rating data
15.times do    
     Rating.create!(
         item_id: Faker::Number.between(from: Item.first.id, to: Item.last.id),
         user_id: Faker::Number.between(from: User.first.id, to: User.last.id),
         stars: Faker::Number.within(range: 1..5)
     )   
end

p "#{Rating.count} ratings created"