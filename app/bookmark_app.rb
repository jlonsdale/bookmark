require 'sinatra/base'
require_relative '../lib/bookmarks'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb :bookmarks
  end

  delete '/bookmarks/:id' do
    Bookmarks.delete(params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark_id = params[:id]
    @bookmark_name = params[:title]
    erb :update
  end

  patch '/bookmarks/:id' do
    Bookmarks.update(params[:id], params[:title], params[:url])
    redirect('/bookmarks')
  end

  post '/add' do
    Bookmarks.add_bookmark(params[:url],params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0

end
