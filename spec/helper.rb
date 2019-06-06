require 'pg'
require 'post'
def setup_data

  connection = PG.connect :dbname => "all_posts_test"
  connection.exec("TRUNCATE TABLE posts")
  Post.create("Bob", "I dont care about anything")
  Post.create("Emma", "I am creating a new entry for my blog")
  
end