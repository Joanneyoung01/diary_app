require 'sinatra/base'
require './lib/diary_entry'

class Diary_App < Sinatra::Base
  get '/' do
    erb :index
  end

  #view all entries
  get '/diary' do
    @entries = Diary_entry.all
    erb :"diary/index"
  end

  #create a new entry
  get '/diary/new' do
    erb :"diary/new"
  end

  #post a new entry, send to all entries page
  post '/diary' do
    p params
    Diary_entry.create(title: params[:title])
    redirect '/diary'
  end

  run! if app_file == $0
end