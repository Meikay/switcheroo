module RatingsHelper

    def check_if_user_rated
      if  current_user != Rating.find_by(id: params[:id])
        flash[:message] = "You already rated this item"
      end
    end
end
