require 'rubygems'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, 'sqlite::memory:')

class User
  include DataMapper::Resource

   property :id, Serial
   property :fbcode, String
end

DataMapper.finalize
DataMapper.auto_migrate!

# def random_salt
#   letters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
#   n = letters.size
#   (0...10).map{ letters[rand(n)] }.join
# end

# def hash_password(password,salt)
#   Digest::SHA1.hexdigest(password+salt)
# end

get '/' do
  @fbcallback = "https://www.facebook.com/dialog/oauth?client_id=388741837807046&redirect_uri=#{request.host}:#{request.port}/fb_callback"
  erb :index
end

get '/fb_callback' do 
  User.create(fbcode => params[:code])
  "The facebook code is #{params[:code]}"
end

# post '/register' do
#   @user = User.register(params[:username],params[:password])
#   if @user.save 
#     redirect "/user/#{@user.username}"
#   else
#     erb :index
#   end
# end

# get '/user/:username' do |username|
#   @user = User.first(:username => params[:username])
#   erb :user

# end
