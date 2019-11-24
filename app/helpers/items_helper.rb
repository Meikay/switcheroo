module ItemsHelper
    def show_display_header
        if @user
          content_tag(:h1, "#{@user.username}'s Items:")
        else
          content_tag(:h2, "My Items")
        end
      end
end
