require 'pry'
class CartItemsController < ApplicationController
      
    
    def create
        @cart = current_cart
        @item = @cart.cart_items.new(item_params)
        #binding.pry
        @cart.save
        session[:cart_id] = @cart.id
        redirect_to user_cart_path(current_user)
      end
  

      def destroy
        @cart = current_cart
        @item = @cart.cart_items.find(params[:id])
        @item.destroy
        @cart.save
        redirect_to user_cart_path 
      end


      private
    
      def item_params
        params.require(:cart_item).permit(:quantity, :item_id, :cart_id)
      end
end