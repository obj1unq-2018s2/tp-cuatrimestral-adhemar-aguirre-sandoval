import Minions.*
import Campeon.*
import items.*


class EjercitoDeMinions  {
	var property ejercito =[]
	
	
	method reclutarOleada(minion){
		ejercito.add(minion)
	}
	
	method ejercitoMuerto(){
		return ejercito.all{oleada=> oleada.estaMuerto()}
	}
	method recibeAtaque(num){
		ejercito.forEach{oleada=>oleada.reciboDanio(num)}
	}
	method ataqueTotal(){
		return ejercito.sum{oleada=>oleada.puntosDeAtaque()}
	}
	method defenderse(campeon){
		if(campeon.bloqueos() == 0  ) {campeon.puntosDeDanio(campeon.puntosDeDanio() + self.ataqueTotal())}
			else{campeon.bloqueos(campeon.bloqueos() -1)}
	}	
}