import items.*
import Campeon.*

class Minions {

	var property puntosDeDanio = 0 // solo para la parte 2
	var property puntosDeAtaque = 0
	var property cantidadMinions = 0
	var property plus = 0

	method dineroQueOtorga(campeon) {
		return (cantidadMinions - campeon.puntosDeAtaqueTotal()).max(0)
		
	}

	method puntosDeAtaque() {
		return if (cantidadMinions > 0) {
			cantidadMinions + plus
		} else {
			0
		}
	}

	method defender(campeon) {
		if (campeon.bloqueos() == 0) {
			campeon.puntosDeDanio(campeon.puntosDeDanio() + self.puntosDeAtaque())
		} else {
			campeon.bloqueos(campeon.bloqueos() - 1)
		}
	}

	method recibeAtaque(campeon) {
		self.reciboDanio(campeon.puntosDeAtaqueTotal())
	}

	method reciboDanio(num) { // SEGUNDA PARTE
		cantidadMinions = (cantidadMinions - num).max(0)
	}

	method estaMuerto() { // SEGUNDA PARTE
		return cantidadMinions == 0
	}


}
