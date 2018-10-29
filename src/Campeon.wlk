import Minions.*

class Campeon {

	var property puntosDeVida = 0
	var property puntosDeAtaque = 0
	var property puntosDeDanio = 0
	var property items = []
	var property bloqueos = 0

	method equiparItem(item) {
		items.add(item)
		item.efectoEquipar(self)
	}

	method desequiparItem(item) {
		if (items.contains(item)) {
			items.remove(item)
			item.efectoDesequipar(self)
		}
	}

	method muereCampeon() {
		return self.puntosDeVida() <= self.puntosDeDanio()
	}
	
	method atacar(minion){
		minion.puntosDeDanio(minion.puntosDeDanio() + self.puntosDeAtaque()) 
		self.puntosDeDanio(self.puntosDeDanio() + minion.puntosDeAtaque())
	}
	
	method luchar(minion) {
		if (not self.muereCampeon() and not minion.muereMinions() ){
			self.atacar(minion)
		}
	}

}


// este es el otro camino que intentamos pero no salio

/* class Personaje {

	var puntosDeVida
	var puntosDeDanio = 0

	method atacar(personaje, num) {
	}

	method defender(num) {
	}

	method recibirDanio(num) {
	}

}

class Campeon inherits Personaje {

	var property puntosDeAtaque
	var bloqueos = 0
	var items = []

	method equipar(item) {
		items.add(item)
	}

	method desequipar(item) {
		items.remove(item)
	}

	override method atacar(minion, puntosdeAtaque) {
		minion.defender(self.puntosDeAtaque())
	}

	override method defender(num) {
		if (self.bloqueos() > 0) {
			bloqueos -= 1
			}
			else {
				self.recibirDanio(num)
		}
	}

	override method recibirDanio(num) {
		puntosDeDanio = puntosDeDanio + num
	}

	method bloqueos() {
		return bloqueos
	}

}

// oleada = minions
class Minions inherits Personaje {

	var cantidad = 1
	var plus = 0

	override method atacar(campeon, oleada) {
		campeon.defender(oleada)
	}

	override method defender(campeon, oleada) {
		self.recibirDanio(campeon.puntosDeAtaque())
		self.atacar(campeon, oleada)
	}

	override method recibirDanio(numero) {
		puntosDeDanio = puntosDeDanio + numero
	}

	method oleada() {
		return cantidad + plus
	}

} */