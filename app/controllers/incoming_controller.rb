class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create 
    @user = User.find_by(email: params[:sender])
    @topic = @user.topics.find_or_create_by(title: params[:subject])
    @url = params['body-plain']

  
    @bookmark = Bookmark.create(url: @url)
    @bookmark.topic = @topic
    @bookmark.user = @user
    @bookmark.save!
    
    puts @bookmark.url
    
    head 200
  end
end
