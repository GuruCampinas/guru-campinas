class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :twitter, :github

  validates_presence_of :name

  def to_s
    name
  end

  def twitter_url
    "http://twitter.com/#{twitter}"
  end

  def github_url
    "https://github.com/#{github}"
  end
end
