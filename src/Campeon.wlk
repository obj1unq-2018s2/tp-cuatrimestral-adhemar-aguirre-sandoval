import Minions.*
import items.*

class Campeon {

	const vidaBase = 0
	var property puntosDeAtaqueBase = 0
	var property puntosDeDanio = 0
	var property items = []
	var property bloqueos = 0
	var property cantDinero = 0

	method vidaBase() = vidaBase

	method invetario() = items

	method reducirDanio(cant) {
		if (puntosDeDanio.between(0, cant)) {
			puntosDeDanio = 0
		} else {
			puntosDeDanio = puntosDeDanio - cant
		}
	}

	method comprar(item) {
		if (cantDinero >= item.precio()) {
			self.equiparItem(item)
			cantDinero = cantDinero - item.precio()
		}
	}

	method vender(item) {
		cantDinero = cantDinero + (item.precio() * 0.5)
		self.desequiparItem(item)
	}

	method activarHabilidad(item) {
		item.habilidadActivada(self)
	}

	method equiparItem(item) {
		items.add(item)
		item.efectoEquipar(self)
	}

	method desequiparItem(item) {
		items.remove(item)
		item.efectoDesequipar(self)
	}

	method vidaTotal() {
		return items.map({ item => item.puntosDeVida(self) }).sum() + vidaBase
	}

	method puntosDeAtaqueTotal() {
		return items.map({ item => item.puntosDeAtaque(self) }).sum() + puntosDeAtaqueBase
	}

	method muereCampeon() {
		return self.vidaTotal() <= self.puntosDeDanio()
	}

	method atacar(minion) {
		minion.puntosDeDanio(minion.puntosDeDanio() + self.puntosDeAtaqueTotal())
		self.dineroObtenido(minion)
	}

	method dineroObtenido(minion) {
		if (self.puntosDeAtaqueTotal() >= minion.cantidad()) {
			cantDinero = cantDinero + minion.cantidad()
		} else {
			cantDinero = cantDinero + self.puntosDeAtaqueTotal()
		}
	}

	method dineroPorOleada(minion) {
		if (self.puntosDeAtaqueTotal() >= minion.cantidad()) {
			return  minion.cantidad()
		} else {
			return self.puntosDeAtaqueTotal()
		}
	}

	method luchar(minion) {
		if (not minion.estaMuerto()) {
			self.atacar(minion)
			minion.defender(self)
			minion.reciboDanio(minion.puntosDeDanio())
		} else {
			self.atacar(minion)
		}
	}

	method atacarEjercito(ejercito) {
		ejercito.recibeAtaque(self.puntosDeAtaqueTotal())
	}

	method lucharEjercito(ejercito) {
		if (not ejercito.ejercitoMuerto()) {
			ejercito.defenderse(self)
			self.atacarEjercito(ejercito)
		} else {
			self.atacarEjercito(ejercito)
		}
	}

}

