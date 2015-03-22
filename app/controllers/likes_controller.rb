class LikesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like

    if like.save
      flash[:notice] = "Liked was saved."
      redirect_to [@topic, @bookmark]
    else
      flash[:error] = "There was an error to like the bookmark. Please try again."
      redirect_to [@topic, @bookmark]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    authorize like

    if like.destroy
      flash[:notice] = "Unliked was saved."
      redirect_to [@topic, @bookmark]    
    else
      flash[:notice] = "There was an error to unlike the bookmark. Please try again."
      redirect_to [@topic, @bookmark]
    end
  end
  
end
