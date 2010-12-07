require "open-uri"

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :twitter, :github

  has_many :projects, :dependent => :destroy

  validates_presence_of :name

  after_save :fetch_github_repositories!

  def to_s
    name
  end

  def twitter_url
    "http://twitter.com/#{twitter}"
  end

  def github_url
    "https://github.com/#{github}"
  end

  def fetch_github_repositories!
    projects.destroy_all

    if github.present?
      result = YAML.load open("http://github.com/api/v2/yaml/repos/show/#{github}/")

       result["repositories"].each do |repository|
        projects.create :name => repository[:name], :description => repository[:description]
      end
    end
  end
end
