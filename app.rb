require 'sinatra/base'
require './lib/post'

class MessageBoard < Sinatra::Base
  
  get '/' do
   "Hello"
  end

  get '/add-post' do
    erb :index
  end

  post '/saving' do
    @new_post = Post.create(params[:name], params[:content])
    redirect('/main')
  end

  get '/main' do
    @all_posts = Post.all
    erb :main
  end


  run! if app_file == $0
end