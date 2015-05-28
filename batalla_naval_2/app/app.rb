require_relative 'models/board.rb'

module Battleship
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions
    
    get '/start' do
      render 'battle/start'
    end
  end  
end

