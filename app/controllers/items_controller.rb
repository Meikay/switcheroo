class ItemsController < ApplicationController
    before_action :redirect_if_not_logged_in
   

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @item = @user.items.build
        else
            @item = Item.new
        end
        #@item.build_cart
    end

    def create  
        @item = current_user.items.build(item_params)  
        #binding.pry
        if @item.save
            redirect_to item_path(@item)  #redirect to user's account page with items posted
        else
            render :new
        end
    end

    def index
        @items = Item.all
    end

    def edit
        @item = Item.find_by_id(params[:id])
        redirect_to items_path if !@item || @item.user != current_user
        #@item.build_cart if !@item.cart
      end
    
      def update
         @item = Item.find_by(id: params[:id])
         redirect_to items_path if !@item || @item.user != current_user
        if @item.update(item_params)
          redirect_to item_path(@item)
        else
          render :edit
        end
      end

    def show
        
    end

    def destroy
        # @item = Item.find(params[:id])
        # @item.destroy
        # redirect_to items_path(@item)
    end

    private

    def item_params
        params.require(:item).permit(:item_name, :item_description, :user_id)
    end

   
end
