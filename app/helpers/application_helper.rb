module ApplicationHelper


    #check if there's a cart_id associated with the session and then find that cart
    def current_cart  #make cart persistent so that people who log back in are able to see the same cart
        current_user.cart
    end 
end
