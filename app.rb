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
    erb :"diary/new"
  end

  #post a new entry, send to all entries page
  post '/diary' do
    p params
    @title = params['title']
    connection = PG.connect(dbname: 'diary_test')
    connection.exec("INSERT INTO diary_entries (title) VALUES('#{@title}')")
    redirect '/diary'
  end

  run! if app_file == $0
end