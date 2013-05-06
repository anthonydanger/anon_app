require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Anon App" }

  describe "Home page" do

  	it "should have the h1 'Anon App'" do
  		visit '/static_pages/home'
  		page.should have_selector('h1', :text => 'Anon App')
  	end

  	it "should have the base title" do
  		visit '/static_pages/home'
  		page.should have_selector('title', :text => "Anon App")
  	end  

    it "should not have a custom page title" do 
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help page" do

  	it "should have the h1 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('h1', :text => 'Help')
  	end

  	it "should have the Title 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('title', :text => "#{base_title} | Help")
  	end  
  end

    describe "About page" do

  	it "should have the h1 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_selector('h1', :text => 'About Us')
  	end

  	it "should have the Title 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_selector('title', :text => "#{base_title} | About Us")
  	end

    describe "Contact Us" do

    it "should have the h1 'Contact Us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact Us')
    end

    it "should have the Title 'Contact Us'" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => "#{base_title} | Contact Us")
    end  
  end
end
end