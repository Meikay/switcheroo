class Cart < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  #before_create :update_status

  private

  # def update_status
  #   if self.status == nil?
  #     self.status = "In progress"
  #   end
  # end

#   def add_item(item_id)
#     item = items.where('item_id = ?', item_id).first
#       if item
#           # increase the quantity of product in cart
#           item.quantity + 1
#           save
#       else
#         # product does not exist in cart
#         item = Item.find(item_id)
#         items << item
#       end
#     save
#   end
 end
