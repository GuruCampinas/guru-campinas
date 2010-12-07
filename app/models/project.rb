class Project < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user

  def to_s
    name
  end

  def url
    "https://github.com/#{user.github}/#{name}"
  end
end
