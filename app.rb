require 'rubygems'
require 'sinatra'
# require 'data_mapper'
# require 'dm-migrations'

# DataMapper::Logger.new($stdout, :debug)

# DataMapper.setup(:default, 'sqlite::memory:')

# class User
#   include DataMapper::Resource
# 
#   property :id, Serial
#   property :username, String, :unique => true,
#     :messages => {
#       :is_unique => "That username is already taken"
#     }
#   property :password, String
#   property :salt, String
#   property :created, DateTime
# 
#   def self.register(username,password)
#     salt = random_salt
#     hash = hash_password(password,salt)
#     User.new(:username => username,
#         :password => hash,
#         :salt => salt,
#         :created => Time.now)
#   end
# end

# DataMapper.finalize
# DataMapper.auto_migrate!

# def random_salt
#   letters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
#   n = letters.size
#   (0...10).map{ letters[rand(n)] }.join
# end

# def hash_password(password,salt)
#   Digest::SHA1.hexdigest(password+salt)
# end

get '/' do
  erb :index
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
