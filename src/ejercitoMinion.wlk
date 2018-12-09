import Minions.*
import Campeon.*
import items.*


class EjercitoDeMinions inherits Minions {
	var property ejercito =[]
	
	
	method reclutarOleada(minion){
		ejercito.add(minion)
	}
	
	override	method estaMuerto(){
		return ejercito.all{oleada=> oleada.estaMuerto()}
	}
override	method recibeAtaque(campeon){
		ejercito.forEach{oleada=>oleada.reciboDanio(campeon.puntosDeAtaqueTotal())}
	}
	
override	method dineroQueOtorga(campeon){
	return ejercito.map{minion=> minion.dineroQueOtorga(campeon)}.sum()
}
	method ataqueTotal(){
		return ejercito.sum{oleada=>oleada.puntosDeAtaque()}
	}
	override	method defender(campeon){
		if(campeon.bloqueos() == 0  ) {campeon.puntosDeDanio(campeon.puntosDeDanio() + self.ataqueTotal())}
			else{campeon.bloqueos(campeon.bloqueos() -1)}
	}	
}