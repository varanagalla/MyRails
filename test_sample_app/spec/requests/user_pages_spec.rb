require 'spec_helper'

describe "UserPages" do
  subject { page }
  describe "Signup Page" do
    before { visit signup_path }
    it { should have_selector('h1', text: 'Sign up')}
    it { should have_selector('title', text: 'Sign up')}
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: user.name) }
  end
  
  describe "signup" do
    before { visit signup_path }
    let(:submit) { "Create my account" }
    
    describe "with invalid information" do
      it "should not create user for invalid data" do
        expect { click_button submit }.not_to change(User, :count)
      end
      
      describe "after submission" do
        before { click_button submit }
        it { should have_content('error') }
        it { should have_selector('title', text: 'Sign up') }
      end
      
    end
    
    describe "with valid information" do
      before do
        fill_in "Name",        with: "tester"
        fill_in "Email",       with: "test@vararails.com"
        fill_in "Password",    with: "vara@ruby"
        fill_in "Confirmation",with: "vara@ruby"
      end
      
      it "should create user for valid data" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after submission" do
        before { click_button submit }
        it { should have_selector('title', text: 'tester') }
        it { should have_selector('h1', text: 'tester') }
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email("test@vararails.com") }
        
        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
        
      end
      
    end
  end
end
