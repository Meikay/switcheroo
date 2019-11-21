class ItemsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @item = Item.new
    end

    # def index
    #     @item = Item.find params[:item_id]
    # end

    def create  #when hit pry, item should have a user_id to know who posted it
        @item = current_user.items.build(item_params)  
        if @item.save
            redirect_to items_path  #redirect to user's account page with items posted
        else
            render :new
        end
    end

    private

    def item_params
        params.require(:item).permit(:item_name, :item_description, :user_id)
    end

    #tried adding user_id to item_params
    #tried creating user before creating item and added user_id to item but still get same error["User must exist"]
end
