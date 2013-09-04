require 'spec_helper'

describe "Static pages" do
  
  describe "Home page" do
    it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.should have_selector('h1',:text => ' App')
    end    
    it 'should have the right title | Home' do
      visit '/static_pages/home'
      page.should have_selector('title',:text => "Ruby on Rails Tutorial Sample App | Home")
    end
  end
  
  describe "Help page" do
    it "should have the content 'Sample App Help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/help'
      page.should have_selector('h1',:text => 'Sample App Help')
    end

    it 'should have the right title | Help' do
      visit '/static_pages/help'
      page.should have_selector('title',
                  :text => " | Help")
    end

  end
  
  describe "About page" do
    it "should have the content 'About Us'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/about'
      page.should have_content('About Us')
    end

    it 'should have the right title | About Us' do
      visit '/static_pages/about'
      page.should have_selector('title',
                  :text => " | About Us")
    end

  end
  
  
  
end
