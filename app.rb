<<<<<<< HEAD
# app.rb
require "sinatra"
require "sinatra/activerecord"

set :database, "sqlite3:myblogdb.sqlite3"

require "./models"

require "sinatra/flash"

enable :session

get '/' do

	Post.create(title: "Hello", body: "This is a post")
	@posts = Post.all
	erb :index
end

get '/' do
	erb :'signin', :layout => false
end

get '/sign-in' do
	erb :signin
end

get '/post' do
	@last_post = Post.last
	erb :post_page
end

post '/sign-in' do
	@user = User.where(username: params[:username]).first

	if @user && @user.password == params[:password]
		session[:user_id] = @user.id
		flash[:notice] =  "Welcome! you're now signed in"
	else
		flash[:notice] = "Woops! There was a little hiccup"
		redirect '/'
 end
end
