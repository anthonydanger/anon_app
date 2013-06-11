require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Anon App" }

  subject { page }

  describe "Home page" do
    before { visit root_path }

  	it "should have the h1 'Anon App'" do
  		page.should have_selector('h1', :text => 'Anon App')
  	end

  	it "should have the base title" do
  		page.should have_selector('title', :text => "Anon App")
  	end  

    it "should not have a custom page title" do 
      page.should_not have_selector('title', :text => '| Home')
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem Ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end

  describe "Help page" do

  	it "should have the h1 'Help'" do
  		visit help_path
  		page.should have_selector('h1', :text => 'Help')
  	end

  	it "should have the Title 'Help'" do
  		visit help_path
  		page.should have_selector('title', :text => "#{base_title} | Help")
  	end  
  end

  describe "About page" do

  	it "should have the h1 'About Us'" do
  		visit about_path
  		page.should have_selector('h1', :text => 'About Us')
  	end

  	it "should have the Title 'About Us'" do
  		visit about_path
  		page.should have_selector('title', :text => "#{base_title} | About Us")
  	end

    describe "Contact Us" do

      it "should have the h1 'Contact Us'" do
        visit contact_path
        page.should have_selector('h1', :text => 'Contact Us')
      end

      it "should have the Title 'Contact Us'" do
        visit contact_path
        page.should have_selector('title', :text => "#{base_title} | Contact Us")
      end  
    end
  end
end