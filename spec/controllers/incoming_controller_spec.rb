require 'rails_helper'

describe IncomingController do 
  before do
    @user = User.create(email: 'test@example.com', password: 'changeme')    
  end
  
  describe '#create' do
    
    it 'should accept the params' do 
      params = { sender: @user.email, subject: 'test', :'body-plain' => 'http://test.com' }
      post :create, params      
      @bookmark = Bookmark.last
      
      expect(@bookmark.user.email).to eq("test@example.com")
      expect(@bookmark.url).to eq("http://test.com")
    end
    
  end  

end
