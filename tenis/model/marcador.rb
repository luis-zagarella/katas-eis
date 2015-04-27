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
		gana_el_game(un_jugador)						
	end

	def gana_el_game(un_jugador)
		
	end

	def ganar_set(un_jugador)
		puntaje_games = [0,0]
		ganar_el_set(un_jugador)
	end
	
	def ganar_el_set(un_jugador)
		ganar_game(un_jugador)
	end	
end



