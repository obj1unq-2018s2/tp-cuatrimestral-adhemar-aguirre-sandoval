import Minions.*
import items.*
import ejercitoMinion.*

class Campeon {

	const vidaBase = 0
	var property puntosDeAtaqueBase = 0
	var property puntosDeDanio = 0
	var property items = []
	var property bloqueos = 0
	var property cantDinero = 0
	const runas = []

	method inventario() = items

	method vidaBase() = vidaBase

	method comprar(item) {
		if (cantDinero >= item.precio()) {
			self.equiparItem(item)
			cantDinero = cantDinero - item.precio()
		}
	}

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

	method vidaTotal() {
		return items.map({ item => item.puntosDeVida(self) }).sum() + vidaBase
	}

	method puntosDeAtaqueTotal() {
		return items.map({ item => item.puntosDeAtaque(self) }).sum() + puntosDeAtaqueBase
	}

	method muereCampeon() {
		return self.vidaTotal() <= self.puntosDeDanio()
	}

	method dineroObtenido(minion) {
		cantDinero = cantDinero + minion.dineroQueOtorga(self)
	}

	method atacar(minion) {
		self.dineroObtenido(minion)
		minion.recibeAtaque(self)
	}

	method luchar(minion) {
		if (not self.muereCampeon() and not minion.estaMuerto()) {
			minion.defender(self)
			self.atacar(minion)
		} else {
			not self.muereCampeon() and minion.estaMuerto()
			self.atacar(minion)
		}
	}

	method reducirDanio(valor) {
		puntosDeDanio = (self.puntosDeDanio() - valor).max(0)
	}

	method activarHabilidad(item) {
		item.habilidadActivada(self)
	}

	method tengoItemQueAportaAtque() {
		items.any({ item => item.puntosDeAtaque() > 0})
	}

	method equiparRuna(runa) {
		runa.efectoEquipar(self)
		runas.add(runa)
	}

	method desequiparRuna() {
		runas.clearAll()
	}

	method tengoRuna() {
		return not runas.isEmpty()
	}

}

