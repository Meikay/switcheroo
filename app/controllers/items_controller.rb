class ItemsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @item = Item.new
    end

    def create  #when hit pry, item should have a user_id to know who posted it
        binding.pry
    end
end
