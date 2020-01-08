require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero 
      end

    post '/teams' do
        @team = Team.new(params[:team])
       
        params[:team][:hereos].each do |details|
          Hero.new(details)
        end
       
        @hereos = Hero.all

        # @team.heroes
       
        erb :team
      end

    get '/team' do
         erb :team
     end 

end
