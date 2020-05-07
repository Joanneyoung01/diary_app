require 'sinatra/base'

class Diary_App < Sinatra::Base
  get '/' do
    erb :index
  end

  #view all entries
  get '/diary' do
    erb :"diary/index"
  end

  #create a new entry
  get '/diary/new' do
    erb:"/diary/new"
  end

  #post a new entry, send to all entries page
  post '/diary' do
    #take the params
    @title = params[:title]
    @entry = params[:entry]
    #redirect to the page
    redirect '/diary'
  end

  run! if app_file == $0
end