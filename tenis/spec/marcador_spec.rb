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
     
end
