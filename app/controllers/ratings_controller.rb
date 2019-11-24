class RatingsController < ApplicationController
    before_action : redirect_if_not_logged_in

    def new
        @rating = Rating.new
    end

    def index
    end

    def create
    end
end
