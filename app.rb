require 'sinatra/base'

class Diary_App < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/diary/new' do
    erb:"diary/new"
  end

  run! if app_file == $0
end