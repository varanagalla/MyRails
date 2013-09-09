require 'spec_helper'

describe "Authentication" do
  subject { page }
  before { visit signin_path }
      
   
  
  describe "invalid sign in" do
    before { 
          click_button "Sign in" 
        }
    
    it { should have_selector('h1', text: 'Sign in') }
    it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    it { should have_selector('h1', text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
    
    describe "after visiting another page" do
      before { click_link "Home" }
     # it { should_not have_selector 'div.alert.alert-error' }
     it { should_not have_error_message('Invalid') }
    end
    
  end
  
  describe "with valid information" do
    let(:user) { FactoryGirl.create(:user) }
=begin
    before do
      fill_in  "Email", with: user.email 
      fill_in  "Password", with: user.password
      click_button "Sign in"
    end
=end
    before { valid_signin(user) }
    it { should have_selector('title', text: user.name) }
    it { should have_selector('h1', text: user.name) }
    it { should have_link('Profile', href: user_path(user)) }
    it { should have_link('Sign out', href: signout_path)}
    it { should_not have_link('Sign in', href: signin_path)}
    
    describe "followed by signout" do
      before { click_link "Sign out" }
      it { should have_link('Sign in') } 
    end
    
  end
  
  
  
end