require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  describe "Home page" do
    it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      page.should have_selector('h1',:text => ' App')
    end    
    it 'should have the right title | Home' do
      visit '/static_pages/home'
      page.should have_selector('title',:text => "#{base_title} | Home")
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
                  :text => "#{base_title} | Help")
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
                  :text => "#{base_title} | About Us")
    end

  end
  
  describe "Contact page" do
    it "should have the content 'About Us'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/contact'
      page.should have_content('Contact')
    end

    it 'should have the right title | Contact' do
      visit '/static_pages/contact'
      page.should have_selector('title',
                  :text => " | Contact")
    end

  end
  
  
  
end
