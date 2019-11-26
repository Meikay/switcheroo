class RatingsController < ApplicationController
    before_action :redirect_if_not_logged_in
    # before_action :redirect_if_not_rating_author  
    before_action :find_item
    before_action :find_rating, only: [:edit, :update, :destroy]

    def index
        if params[:item_id] && @item = Item.find_by_id(params[:item_id]) #if nested & can find the item
            @ratings = @item.ratings #check for ratings for the specific item
        else
            flash[:message] = "This item has no ratings"
            @ratings = Rating.all
        end
    end
    
    def new
        @rating = Rating.new
    end

    def create
        @rating = Rating.new(rating_params)
        @rating.item_id = @item.id #connect rating's item_id to item's current val
        @rating.user_id = current_user.id
        if @rating.save
            redirect_to items_path
        else
            render :new
        end
    end

    # def show
    #     #@rating = Rating.find_by(id: params[:id])
    # end

    def edit
      #helper method
    end

    def update
        if @rating.update(rating_params) 
            redirect_to items_path
        else 
            render :edit
        end
    end

    def destroy
        @rating.destroy
        redirect_to items_path(@item)
    end

    private

    def rating_params
        params.require(:rating).permit(:stars, :item_id)
    end

    def find_item
        @item = Item.find(params[:item_id])
    end

    def find_rating
        @rating = Rating.find(params[:id])
    end
    
    # def redirect_if_not_rating_author
    #     @rating = Rating.find_by_id(params[:rating_id])
    #     redirect_to item_ratings_path if @rating.user != current_user
    # end
end