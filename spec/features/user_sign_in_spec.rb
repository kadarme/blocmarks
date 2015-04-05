require 'rails_helper'

describe "Log process" do

  describe "sign in successful" do
    it "redirects to the homepage" do
      user = create(:user)
      visit root_path

      within '.user-info' do
        click_link 'Sign In'
      end

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      within 'form' do
        click_button 'Sign in'
      end

      expect(current_path).to eq root_path
      expect(page).to have_content "Home All Topics My Bookmarks and Likes"    
    end
  end
  
  describe "sign out successful" do
    it "redirects to the homepage" do
      user = create(:user)
      visit root_path

    within '.user-info' do
      click_link 'Sign In'
    end

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    within 'form' do       
      click_button 'Sign in'
    end

    within '.user-info' do  #css class
      click_link 'Sign out'
    end

    within '.user-info' do  #css class
      expect(page).to have_content "Sign In or Sign Up"     
    end

    end
  end
end