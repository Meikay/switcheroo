class RatingsController < ApplicationController
    # before_action :redirect_if_not_logged_in
    # before_action :redirect_if_not_rating_author  
    # before_action :find_rating
    before_action :find_item

    # def index
    #     if params[:item_id] && @item = Item.find_by_id(params[:item_id]) #if nested & can find the post
    #         @ratings = @item.ratings #check for ratings for the specific item
    #     else
    #         flash[:message] = "This item has no ratings"
    #         @ratings = Rating.all
    #     end
    # end
    
    def new
        @rating = Rating.new
    end

    def create
        @rating = Rating.new(rating_params)
        @rating.item_id = @item.id #connect rating's item_id to item's current val
        @rating.user_id = current_user.id
        #@rating = current_user.ratings.build(rating_params)
        if @rating.save
            redirect_to item_rating_path
        else
            render :new
        end
    end

    # def show
    #     #@rating = Rating.find_by(id: params[:id])
    # end

    # def edit
    #     @rating = Rating.find_by(id: params[:id])
    # end

    # def update
    #     @rating = Rating.find_by(id: params[:id])
    # end

    private

    def rating_params
        params.require(:rating).permit(:stars, :item_id)
    end

    def find_item
        @item = Item.find(params[:item_id])
    end

    # def find_rating
    #     @rating = Rating.find_by(id: params[:id])
    #     if !@rating
    #         flash[:message] = "Be the first to rate this item!"
    #         redirect_to item_ratings_path
    #     end
    # end
    
    # def redirect_if_not_rating_author
    #     @rating = Rating.find_by_id(params[:rating_id])
    #     redirect_to item_ratings_path if @rating.user != current_user
    # end
end
