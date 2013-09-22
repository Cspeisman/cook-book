
get '/signup' do
	erb :'user/signup'
end

get '/login' do 
	erb :'user/login'
end

get '/logout' do 
	session.clear 
	redirect '/login'
end

get '/user/:id' do
	@user = User.find(session[:user_id])
	if request.xhr?
		erb :'user/cookbook', layout: false 
	else
		erb :'user/cookbook'
	end
end

# POSTS ============================

post '/signup' do 
	user = User.create(params[:user])
	user.cook_book = CookBook.create
	user.save
	session[:user_id] = user.id
	redirect "/user/#{user.id}"
end 

post '/login' do 
	user = User.find_by_username(params[:user][:username])
	if user && user.password == params[:user][:password]
		session[:user_id] = user.id
		p session
	redirect "/user/#{user.id}"
	else
		redirect '/login'
	end
end