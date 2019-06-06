require 'post'

describe Post do
  let(:post) { Post.new }
  it "creates new posts in the database" do
    setup_data
    expect(Post.all.last).to be_a_kind_of(Post)
  end
  it "retrieves posts from database" do
    setup_data
    expect(Post.all.length).to eq(2)
    expect(Post.all).to include(Post)
    expect(Post.all.first.name).to eq("Bob")
    expect(Post.all.first.content).to eq("I dont care about anything")
  end

  it 'does not create a new bookmark if the URL is not valid' do
   
  end
end