#shotgun app.rb -p 9294
require 'sinatra'

set :bind, '0.0.0.0'

nginx_redirect_uri =  "http://localhost:8080/callback?"  #nginx callback


get("/") do
  erb :root
end

get("/auth/login") do
  logger.info("Params"..params)
  @my_local_state = params[:state]
  @plan_id = params[:scope]
  @pre_token = params[:tok]
  erb :login
end

post("/auth/login") do
  redirect "/consent"
end

get("/consent") do
  erb :consent
end

post("/authorized") do  
  callback =  "#{nginx_redirect_uri}&state=#{params[:state]}"
  puts callback
  redirect callback
end

post("/denied") do 
  callback =  "#{nginx_redirect_uri}&state=#{params[:state]}"
  puts callback
  redirect callback
end