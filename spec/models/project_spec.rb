require 'spec_helper'

describe Project do
  describe "to_s" do
    it "should return the project name" do
      Project.new(:name => "rails").to_s.should == "rails"
    end
  end

  describe "url" do
    it "should return a valid project url" do
      project = Project.new(:name => "jquery-ujs", :user => User.new(:github => "rails"))

      project.url.should == "https://github.com/rails/jquery-ujs"
    end
  end
end
