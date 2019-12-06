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

    # def create
    #     @cart = current_cart
    #     item = Item.find(params[:item_id])
    #     @cart_item = @cart.cart_items.build(:item => item)
    #     if @cart_item.save
    #         redirect_to @cart_item.cart
    #         flash.now[:success]="Added to Cart"
    #     else
    #         render :new
    #     end
    # end 

    
  

      def destroy
        @cart = current_cart
        @item = @cart.cart_items.find(params[:id])
        @item.destroy
        @cart.save
        redirect_to user_cart_path 
      end

    #   def show
    #     @cart_items = current_cart.cart_items
    #   end

      private
    
      def item_params
        params.require(:cart_item).permit(:quantity, :item_id, :cart_id)
      end
end