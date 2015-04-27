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

	def set_puntaje_puntos(un_puntaje)
		@puntaje_puntos = un_puntaje
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

	def ganar_punto(un_jugador)
		punto_que_sigue = siguiente_punto(puntaje_puntos.at(un_jugador - 1))
		if(punto_que_sigue == 0)
			ganar_game(un_jugador)		
		elsif(un_jugador == 1)
			set_puntaje_puntos([punto_que_sigue, puntaje_puntos.at(1)])
		elsif(un_jugador == 2)
			set_puntaje_puntos([puntaje_puntos.at(0), punto_que_sigue])
		end		
	end

	def siguiente_punto(un_puntaje)
		puntaje_resultado = 0		
		if(un_puntaje == 0)
			puntaje_resultado = 15
		elsif(un_puntaje == 15)
			puntaje_resultado = 30
		elsif(un_puntaje == 30)
			puntaje_resultado = 40	
		end
		puntaje_resultado
	end

	def ganar_game(un_jugador)
		set_puntaje_puntos([0,0])
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



