module ApplicationHelper

    def current_cart
        if session[:cart_id]
          @current_cart = Cart.find(session[:cart_id])
        else
            Cart.new
        # if session[:cart_id].nil?
        #   @current_cart = Cart.create!
        #   session[:cart_id] = @current_cart.id
        # end
        # @current_cart
        end
    end 
end
