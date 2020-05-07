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
    #take the params and push it into a new object 'diary entry'
    @title = params[:title]
    @entry = params[:entry]
    # Diary_entry.create(url: params['title'], title: params[:entry])
    #redirect to the page
    erb :"diary/index"
  end

  run! if app_file == $0
end