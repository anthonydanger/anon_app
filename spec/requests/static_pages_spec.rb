require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

  	it "should have the h1 'Anon App'" do
  		visit '/static_pages/home'
  		page.should have_selector('h1', :text => 'Anon App')
  	end

  	it "should have the Title 'Home'" do
  		visit '/static_pages/home'
  		page.should have_selector('title', :text => 'Anon App | Home')
  	end  
  end

  describe "Help page" do

  	it "should have the h1 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('h1', :text => 'Help')
  	end

  	it "should have the Title 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('title', :text => 'Anon App | Help')
  	end  
  end

    describe "About page" do

  	it "should have the h1 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_selector('h1', :text => 'About Us')
  	end

  	it "should have the Title 'About Us'" do
  		visit '/static_pages/about'
  		page.should have_selector('title', :text => 'Anon App | About Us')
  	end  
  end
end