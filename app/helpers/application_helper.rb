module ApplicationHelper


    #check if there's a cart_id associated with the session and then find that cart
    # def current_cart  #make cart persistent so that people who log back in are able to see the same cart
    #     current_user.cart
    # end 
    # The cart id is held in the session. If no cart is referenced or found, a new one is created and the id stored
    # in the session. Either way, a cart object is returned.
    def current_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
end
