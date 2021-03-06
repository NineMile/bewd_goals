

class ActiveRecord
  def initialize
    @@objects ||= []
    @@objects << self
  end

  def self.all
    @@objects
  end
end


class Post < ActiveRecord
  attr_accessor :title

  def initialize(title)
    @title = title
  end
end


10.times do |n|
  Post.new("Title Nunber #{n}")
end


html = ''

Post.all.each do |post|
  html << "<h1>#{post.title}</h1>"
end

File.write('blog.html', html)
