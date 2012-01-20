require 'sinatra'
require 'data_mapper'
require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, 'sqlite::memory:')

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :unique => true,
    :messages => {
      :is_unique => "That username is already taken"
    }
  property :password, String
  property :created, DateTime
end

DataMapper.finalize
DataMapper.auto_migrate!

get '/' do
  erb :index
end

post '/register' do
  # do stuff
  @user = User.new(:username => params[:username],
              :password => params[:password],
              :created => Time.now)
  if @user.save 
    redirect "/user/#{@user.id}"
  else
    erb :index
  end
end

get '/user/:id' do |id|
  @user = User.get(id)
  erb :user
end
