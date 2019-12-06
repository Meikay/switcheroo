module ApplicationHelper


    #check if there's a cart_id associated with the session and then find that cart
    def current_cart   
        current_user.cart
    end 
end
