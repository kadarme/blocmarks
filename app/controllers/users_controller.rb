class UsersController < ApplicationController
  def show
    @added_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.likes
  end
end
