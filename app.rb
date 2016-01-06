require "sinatra"
require "sinatra/activerecord"
require "./models"

set :database, "sqlite3:tweeterdb.sqlite3"

enable :sessions

get '/' do
	erb:'sign-in', :layout => false
end	


post '/sign-in' do
	@user = User.where(username: params[:username]).last

	if @user && @user.password == params[:password]
		# session[:user_id] 
		# flash[:notice] = "You are signed in"
		redirect '/'

	else
		redirect '/sign-in'
	end
end

get '/signup' do
	erb:'signup', :layout => false
end	




