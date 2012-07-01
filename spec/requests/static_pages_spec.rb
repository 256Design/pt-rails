require 'spec_helper'

describe "Static Pages" do

  subject { page }
 
  shared_examples_for "all static pages" do
    it { should have_selector('h1', :text => heading) }
    it { should have_selector('title', :text => full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    
    let(:heading)     { 'Project Transparency' }
    let(:page_title)  { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector('title', text: ' | Home') }
  end
  
  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1', :text => 'About Us') }
    it { should have_selector('title', :text => full_title('About Us')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', :text => 'Contact') }
    it { should have_selector('title', :text => full_title('Contact')) }
  end
  
  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1', :text => 'Help') }
    it { should have_selector('title', :text => full_title('Help')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Make an account"
    page.should have_selector 'title', text: full_title('Sign Up')
    click_link "Project Transparency"
    page.should have_selector 'title', text: full_title('')
  end
end
