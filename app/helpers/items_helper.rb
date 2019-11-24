module ItemsHelper
    def show_display_header
        if @user
          content_tag(:h1, "#{@user.username}'s Items:")
        else
          content_tag(:h2, "My Items")
        end
      end
    
    #   def display_items
    #     if @user.items.empty?
    #       tag.h2(link_to('No items yet - Add an item here', new_item_path))
    #     else
    #       user = @user == current_user ? 'Your' : "#{@user.username}'s"
    #       content_tag(:h2, "#{user} #{pluralize(@user.items.count, 'Item')}:")
    
    #     end
    #   end
end
