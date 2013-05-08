require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Anon App" }

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