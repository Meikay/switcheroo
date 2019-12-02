class CartItemsController < ApplicationConttroller
    def create
        @cart = current_cart
        @item = @cart.cart_items.new(item_params)
        @cart.save
        session[:cart_id] = @cart.id
        redirect_to items_path
      end
    
      private
    
      def item_params
        params.require(:cart_item).permit(:quantity, :item_id)
      end
end