require 'rspec'
require_relative '../model/marcador.rb'

describe 'Marcador' do

  describe 'initialize' do

	it 'el partido deberia comenzar en 0' do
		marcador = Marcador.new
		marcador.puntaje_puntos.should eq [0,0]
 		marcador.puntaje_games.should eq [0,0]
		marcador.puntaje_sets.should eq [0,0]
	end	
 
  end

  describe 'ganar_game' do
 
	it 'cuando un jugador gana un game, los puntos vuelven a 0-0 - case: gana jugador 1 el game' do
		marcador = Marcador.new	
		marcador.ganar_game(1)
		marcador.puntaje_puntos.should eq [0,0]
	end
     
  end

end
