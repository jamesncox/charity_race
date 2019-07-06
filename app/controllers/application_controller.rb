require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    
    def logged_in?
      !!current_runner
    end
    
    def current_runner
      @current_runner ||= Runner.find_by_id(session[:runner_id]) if session[:runner_id]
    end 
    
  end 

end
