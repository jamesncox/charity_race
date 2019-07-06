class RunnersController < ApplicationController

    get '/signup' do
        if !logged_in?
          erb :"runners/signup"
        else 
          redirect to '/PLACEHOLDER' 
        end 
      end 
    
      post '/signup' do
       if params[:username] == "" || params[:email] == "" || params[:password] == ""
          redirect to '/signup'
        else
          @runner = Runner.new(:username => params[:username], :email => params[:email], :password => params[:password])
          @runner.save
          session[:runner_id] = @runner.id
          redirect to '/PLACEHOLDER'
        end 
      end
      
      get '/login' do
        if !logged_in?
          erb :'runners/login'
        else
          redirect to '/PLACEHOLDER'
        end
      end 
      
      post '/login' do 
        @runner = Runner.find_by(username: params[:username])
        if @runner && @runner.authenticate(params[:password])
          session[:runner_id] = @runner.id 
          redirect to '/PLACEHOLDER(races?)'
        else 
          erb :index
        end 
      end
      
      get '/runner/:slug' do 
        @runner = Runner.find_by_slug(params[:slug])
        erb :"runner/show"
      end 
    
      get '/logout' do
        if logged_in?
          session.destroy
          erb :index
        else 
          erb :index
        end 
      end 

end 