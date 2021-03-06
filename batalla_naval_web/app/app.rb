require_relative 'models/board.rb'

module Battleship
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions
    
    get '/start' do
      render 'battle/start'
    end

    post 'create-board' do
      @board = Board.new params[:width].to_i, params[:heigth].to_i
      session[:board] = @board
      render 'battle/game' 
    end

    post 'add-small-ship' do
      @board = session[:board]
      point = Point.new(params[:x_small].to_i, params[:y_small].to_i)
      x = params[:x_small].to_s
      y = params[:y_small].to_s
      begin
        session[:board].add_a_ship_to_fleet('small', point, 'North')
        @mje = 'Small ship created at: ' + x + ':' + y + '.' 
      rescue Exception => e
        @mje = e.message
      end  
      session[:board] = @board
      render 'battle/game'
    end

    post 'add-large-ship' do
      @board = session[:board]
      point = Point.new(params[:x_large].to_i, params[:y_large].to_i)
      x = params[:x_large].to_s
      y = params[:y_large].to_s 
      begin
        session[:board].add_a_ship_to_fleet('large', point, 'North')
        @mje = 'Large ship created at: ' + x + ':' + y + '.'
      rescue Exception => e
        @mje = e.message
      end
      session[:board] = @board
      render 'battle/game'
    end

    post 'check-is-empty' do 
      point = Point.new(params[:x_empty].to_i, params[:y_empty].to_i)
      x = params[:x_empty].to_s
      y = params[:y_empty].to_s 
      @mje = 'Position ' + x + ':' + y + ' empty: ' + session[:board].is_empty(point).to_s + '.'    
      render 'battle/game'
    end 

    post 'shoot' do
      @board = session[:board]
      point = Point.new(params[:x_shoot].to_i, params[:y_shoot].to_i)
      begin
        @mje = session[:board].shoot(point)
      rescue Exception => e
        @mje = e.message
      end
      session[:board] = @board
      render 'battle/game'
    end 
  end
end

