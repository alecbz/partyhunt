require 'sinatra'
require 'data_mapper'
require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, 'sqlite::memory')

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, String
end

DataMapper.finalize
DataMapper.auto_migrate!

get '/' do
  erb :index
end

post '/register' do
  # do stuff
  @user = User.create(:username => params[:username],
              :password => params[:password])
  redirect "/user/#{@user.id}"
end

get '/user/:id' do |id|
  @user = User.get(id)
  erb :user
end