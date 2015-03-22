class BookmarksController < ApplicationController
  before_action :get_bookmark, only: [:edit, :update]
  before_action :get_topic, only: [:show, :new, :create, :destroy]
  
  def show
    @bookmark = @topic.bookmarks.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @bookmark.topic = @topic
    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @bookmark.update_attributes(bookmark_params)
      flash[:notice] = "Bookmark was updated."
      redirect_to @bookmark
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :edit
    end
  end
  
  def destroy
    if @bookmark.destroy
       flash[:notice] = "Bookmark was deleted."
       redirect_to @bookmark
    else
       flash[:error] = "There was an error deleting the bookmark. Please try again."
       render :show
    end
  end
  
  private
  
  def get_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
  
  def get_topic
    @topic = Topic.find(params[:topic_id])
  end
  
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
