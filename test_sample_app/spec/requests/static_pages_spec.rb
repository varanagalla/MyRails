require 'spec_helper'

describe "Static pages" do
  # let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading)}
    it { should have_selector('title', text: full_title(page_title))}
  end
  
  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home'}
  end
=begin
    it { should have_selector('h1', text: 'Sample App')}
    it { should have_selector('title', text: full_title(''))}
    it { should_not have_selector('title', text: " | Home")}
=end
=begin
    it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      page.should have_selector('h1',:text => ' App')
    end    
    it 'should have the base title | Home' do
      visit root_path
      page.should have_selector('title',:text => "#{base_title}")
    end
    it 'should not have the custom page title | Home' do
      visit root_path
      page.should_not have_selector('title',:text => " | Home")
    end
=end
  
  
  describe "Help page" do
    before { visit help_path }
    let(:heading) { 'Sample App Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"
  end
=begin
    it { should have_selector('h1', text: 'Sample App Help')}
    it { should have_selector('title', text: full_title('Help'))}
=end
=begin
    it "should have the content 'Sample App Help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit help_path
      page.should have_selector('h1',:text => 'Sample App Help')
    end

    it 'should have the right title | Help' do
      visit help_path
      page.should have_selector('title',
                  :text => "#{base_title} | Help")
    end
=end
   
  describe "About page" do
    before{ visit about_path }
    let(:heading) { 'About Us' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"
  end
=begin
    it { should have_content('About Us') }
    it { should have_selector('title', text: full_title('About Us'))}
=end
=begin
    it "should have the content 'About Us'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit about_path
      page.should have_content('About Us')
    end

    it 'should have the right title | About Us' do
      visit about_path
      page.should have_selector('title',
                  :text => "#{base_title} | About Us")
    end
=end
 
  
  describe "Contact page" do
    before { visit contact_path }
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }
    it_should_behave_like "all static pages"
  end
=begin
    it { should have_content('Contact') }
    it { should have_selector('title', text: full_title('Contact'))}
=end
=begin
    it "should have the content 'About Us'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit contact_path
      page.should have_content('Contact')
    end

    it 'should have the right title | Contact' do
      visit contact_path
      page.should have_selector('title',
                  :text => "#{base_title} | Contact")
    end
=end

    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      should have_selector 'title', text: 'About Us'
      
      click_link "Help"
      should have_selector 'title', text: 'Help'
      
      click_link "Contact"
      should have_selector 'title', text: 'Contact'
      
      click_link "Home"
      click_link "Sign up now!"
      should have_selector 'h1', text: 'Sign up'
      
      click_link "sample app"
      should have_selector 'h1', text: 'Sample App'
    end
 
  
  
  
end
