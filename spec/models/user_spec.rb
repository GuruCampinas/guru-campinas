require 'spec_helper'

describe User do
  describe "to_s" do
    it "should returns the user's name" do
      User.new(:name => "Navarro").to_s.should == "Navarro"
    end
  end

  describe "twitter" do
    context "when it has a twitter account" do
      it "should generate a valid twitter profile url" do
        User.new(:twitter => "_reu").twitter_url.should == "http://twitter.com/_reu"
      end
    end
  end

  describe "github" do
    context "when it has a github account" do
      it "should generate a valid github profile url" do
        User.new(:github => "reu").github_url.should == "https://github.com/reu"
      end
    end
  end
end
