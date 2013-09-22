require 'json'
# GETS ========================================
get '/' do
	if request.xhr?
	  erb :search_form, layout: false
	else
		erb :search_form
	end
end

# POSTS ========================================
post '/recipe' do 
	#build url from search params
	build_url = "http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['app_id']}&_app_key=#{ENV['app_key']}&q=#{params[:recipe]}&requirePictures=true"
	response_string = open(build_url).read
	#parses the json response into a ruby hash
	@json = JSON.parse(response_string)
	
	# obj = File.open( 'config/yummly.json').read
	# @json = JSON.parse(obj)
	
 erb :recipes, layout: false if request.xhr?
end

post '/store_recipe' do
	@cookbook = CookBook.find_by_user_id(session[:user_id])
	recipe =  Recipe.find_or_create_by_name(params[:recipe][:name])
	recipe.update_attributes(params[:recipe])
	recipe.save
	@cookbook.recipes << recipe
	@user = @cookbook.user
	if request.xhr?
		erb :'user/cookbook', layout: false 
	else
		erb :'user/cookbook'
	end
end

