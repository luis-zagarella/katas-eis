require 'rspec'
require_relative '../model/marcador.rb'

describe 'Marcador' do

  describe 'initialize' do

	it 'el partido deberia comenzar en 0' do
		marcador = Marcador.new
		marcador.puntaje_puntos.should eq [0,0]
 		marcador.puntaje_games.should eq [0,0]
		marcador.puntaje_sets.should eq [0,0]
		marcador.ganador.should eq 'partido en curso'
	end	
 
  end

  describe 'ganar_punto' do
  	
	it 'cuando un jugador mete el primer punto del game suma 15' do
		marcador = Marcador.new
		marcador.ganar_punto(1)
		marcador.puntaje_puntos.should eq [15,0]
	end
	
	it 'cuando un jugador mete el segundo punto del game suma 30' do
		marcador = Marcador.new
		marcador.ganar_punto(1)
		marcador.ganar_punto(1)
		marcador.puntaje_puntos.should eq [30,0]
	end
	
	it 'cuando un jugador mete el cuarto punto del game si el otro no suma 40 o ventaja lo gana' do
		marcador = Marcador.new
		marcador.ganar_punto(1)
		marcador.ganar_punto(1)
		marcador.ganar_punto(1)
		marcador.ganar_punto(1)
		marcador.puntaje_puntos.should eq [0,0]
		marcador.puntaje_games.should eq [1,0]
	end

	it 'cuando un jugador obtiene la ventaja en el game debe quedar con la A' do
		marcador = Marcador.new
		marcador.set_puntaje_puntos([40,40])
		marcador.ganar_punto(1)
		marcador.puntaje_puntos.should eq ['A',40]
	end

	it 'cuando un jugador se recupera de una ventaja del rival se debe volver a 40-40' do
		marcador = Marcador.new
		marcador.set_puntaje_puntos([40,'A'])
		marcador.ganar_punto(1)
		marcador.puntaje_puntos.should eq [40,40]
	end	

  end

  describe 'ganar_game' do
 
	it 'cuando un jugador gana un game, los puntos vuelven a 0-0 - case: gana jugador 1 el game' do
		marcador = Marcador.new	
		marcador.ganar_game(1)
		marcador.puntaje_puntos.should eq [0,0]
	end
     
	it 'cuando un jugador gana un game, los puntos vuelven a 0-0 - case: gana jugador 2 el game' do
		marcador = Marcador.new	
		marcador.ganar_game(2)
		marcador.puntaje_puntos.should eq [0,0]
	end
  
  end

  describe 'ganar_set' do  

  	it 'cuando un jugador gana un set, los games vuelven a 0-0 y lo mismo ocurre con los puntos - case: gana jugador 1 el set' do
		marcador = Marcador.new
		marcador.ganar_set(1)
		marcador.puntaje_puntos.should eq [0,0]
                marcador.puntaje_games.should eq [0,0]
	end
	
	it 'cuando un jugador gana un set, los games vuelven a 0-0 y lo mismo ocurre con los puntos - case: gana jugador 2 el set' do
		marcador = Marcador.new
		marcador.ganar_set(2)
		marcador.puntaje_puntos.should eq [0,0]
                marcador.puntaje_games.should eq [0,0]
	end
  
  	it 'cuando un jugador alcance los 6 games gana el set - case: gana jugador 1 el set' do
		marcador = Marcador.new
		marcador.set_puntaje_games([5,0])
		marcador.ganar_game(1)
		marcador.puntaje_sets.should eq [1,0]				
	end

	it 'cuando un jugador alcance los 6 games gana el set - case: gana jugador 2 el set' do
		marcador = Marcador.new
		marcador.set_puntaje_games([0,5])
		marcador.ganar_game(2)
		marcador.puntaje_sets.should eq [0,1]				
	end

  end

  describe 'terminar_partido' do

	it 'el partido termina cuando algunos de los jugadores alcance los 2 sets - case: gana jugador 1 el partido' do
		marcador = Marcador.new
		marcador.ganar_set(1)
		marcador.ganar_set(1)
		marcador.ganador.should eq "el jugador 1 gano el encuentro"
	end

	it 'el partido termina cuando algunos de los jugadores alcance los 2 sets - case: gana jugador 2 el partido' do
		marcador = Marcador.new
		marcador.ganar_set(2)
		marcador.ganar_set(2)
		marcador.ganador.should eq "el jugador 2 gano el encuentro"
	end

	it 'se ganan sets pero el partido sigue en curso' do
		marcador = Marcador.new
		marcador.ganar_set(1)
		marcador.ganar_set(2)
		marcador.puntaje_puntos.should eq [0,0]
 		marcador.puntaje_games.should eq [0,0]
		marcador.puntaje_sets.should eq [1,1]
		marcador.ganador.should eq 'partido en curso'
	end

  end

  describe 'tests_complementarios' do

	it 'el rival del jugador1 debe ser el jugador2 y viceversa' do
		marcador = Marcador.new
		marcador.rival(1).should eq 2
		marcador.rival(2).should eq 1
	end

	it 'testeo el metodo siguiente_punto' do
		marcador = Marcador.new
		marcador.siguiente_punto(0).should eq 15    # pruebo con 0
		marcador.siguiente_punto(15).should eq 30   # con 15
		marcador.siguiente_punto(30).should eq 40   # con 30
		marcador.siguiente_punto(40).should eq 0    # con 40
		marcador.siguiente_punto(89).should eq 0    # con un numero cualquiera
	end

  end

end

