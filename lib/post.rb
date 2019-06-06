require "pg"

class Post
  attr_reader :number, :name, :content

  def initialize(number:, name:, content:)
    # using symbols you dont have to remember the order of arguments just go by their names
    @name = name
    @number = number
    @content = content
  end

  def self.create(name, content)
    begin
      if ENV["RACK_ENV"] == "test"
        connection = PG.connect :dbname => "all_posts_test"
      else
        connection = PG.connect :dbname => "all_posts"
      end
      post_add = connection.exec("INSERT INTO posts (user_name, content) VALUES ('#{name}', '#{content}') RETURNING post_id, user_name, content;")
      # Post.new(number: post_add[0["post_id"], name: post_add[0]["user_name"], content: post_add[0]["content"])
    rescue PG::Error => e
      puts e.message
    ensure
      post_add.clear if post_add
      connection.close if connection
    end
  end

  def self.all
    begin
      if ENV["RACK_ENV"] == "test"
        connection = PG.connect :dbname => "all_posts_test"
      else
        connection = PG.connect :dbname => "all_posts"
      end
      lists_posts = connection.exec "SELECT * FROM posts;"
      lists_posts.map do |post|
        # map is replacing elements in lists_posts
        Post.new(number: post["post_id"], name: post["user_name"], content: post["content"])
      end
    rescue PG::Error => e
      puts e.message
    ensure
      lists_posts.clear if lists_posts
      connection.close if connection
    end
  end
end
