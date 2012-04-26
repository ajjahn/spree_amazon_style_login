require "spec_helper"

describe "Register after guest checkout" do
  context "with valid data" do
    it "should create a new user" do
      fill_in "Password", :with => "password"
      fill_in "Password Confirmation", :with => "password"
      click_button "Create"
      page.should have_content("You have signed up successfully.")
      User.count.should == 1
    end
  end

  context "with invalid data" do
    it "should not create a new user" do
      visit signup_path
      fill_in "Password", :with => "password"
      fill_in "Password Confirmation", :with => ""
      click_button "Create"
      page.should have_css("#errorExplanation")
      User.count.should == 0
    end
  end
end
