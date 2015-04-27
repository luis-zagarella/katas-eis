class Marcador

	def initialize
		@puntaje_puntos = [0,0]
		@puntaje_games = [0,0]
		@puntaje_sets = [0,0]
		@ganador = "partido en curso"
	end

	def ganador
		@ganador
	end

	def set_ganador(un_jugador)
		@ganador = "el jugador #{un_jugador} gano el encuentro"
	end
		
	def puntaje_puntos 
		@puntaje_puntos	
	end
 	
	def puntaje_games
		@puntaje_games 
	end

	def set_puntaje_games(un_puntaje)
		@puntaje_games = un_puntaje
	end
		
	def puntaje_sets 
		@puntaje_sets 
	end

	def set_puntaje_sets(un_puntaje)
		@puntaje_sets = un_puntaje
	end

	def ganar_game(un_jugador)
		puntaje_puntos = [0,0]
		gana_el_game(un_jugador)						
	end

	def gana_el_game(un_jugador)
		if(un_jugador ==  1)
			set_puntaje_games([puntaje_games.at(0) + 1,puntaje_games.at(1)])
			if(puntaje_games.at(0) == 6)
				ganar_set(1)
			end
		else
			set_puntaje_games([puntaje_games.at(0), puntaje_games.at(1) + 1])
			if(puntaje_games.at(1) == 6)
				ganar_set(2)
			end		
		end
	end

	def ganar_set(un_jugador)
		puntaje_games = [0,0]
		gana_el_set(un_jugador)
	end
	
	def gana_el_set(un_jugador)
		if(un_jugador ==  1)
			set_puntaje_sets([puntaje_sets.at(0) + 1,puntaje_sets.at(1)])
		else
			set_puntaje_sets([puntaje_sets.at(0),puntaje_sets.at(1) + 1])
		end
		chequear_si_gano_el_partido(un_jugador)
	end	

	def chequear_si_gano_el_partido(un_jugador)
		if(puntaje_sets.at(un_jugador - 1) == 2)
			ganar_partido(un_jugador)		
		end
	end

	def ganar_partido(un_jugador)
		set_ganador(un_jugador)
	end

end



