class Marcador

	def initialize
		@puntaje_puntos = [0,0]
		@puntaje_games = [0,0]
		@puntaje_sets = [0,0]
	end

	def puntaje_puntos 
		@puntaje_puntos	
	end
 	
	def puntaje_games
		@puntaje_games 
	end
		
	def puntaje_sets 
		@puntaje_sets 
	end

	def ganar_game(un_jugador)
		puntaje_puntos = [0,0]
		if (un_jugador == 1)
			gana_el_game(1)						
		else
			gana_el_game(2)
		end
	end

	def gana_el_game(un_jugador)
	
	end
end
