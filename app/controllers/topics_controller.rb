class TopicsController < ApplicationController
  before_action :get_topic, only: [:edit, :show, :update, :destroy]
  
  def index
    @topics = Topic.all
  end

  def show
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :new
    end
  end
  
  def edit
  end
  
  def update    
     if @topic.update_attributes(topic_params)
       flash[:notice] = "Topic was updated."
       redirect_to @topic
     else
       flash[:error] = "There was an error saving the topic. Please try again."
       render :edit
     end
   end
  
  def destory    
    if @topic.destroy
       flash[:notice] = "Topic was deleted."
       redirect_to @topic
     else
       flash[:error] = "There was an error deleting the topic. Please try again."
       render :show
     end
   end
  
  private
  
  def get_topic
    @topic = Topic.find(params[:id])
  end
  
  def topic_params
    params.require(:topic).permit(:title)
  end
end
