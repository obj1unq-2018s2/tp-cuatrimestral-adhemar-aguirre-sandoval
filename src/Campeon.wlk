import Minions.*
import items.*
import ejercitoMinion.*
import Runas.*

class Campeon {

	const vidaBase = 0
	var property puntosDeAtaqueBase = 0
	var property puntosDeDanio = 0
	var property items = []
	var property bloqueos = 0
	var property cantDinero = 0
	const runas = []


	
	method inventario() = items + runas

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
		return self.inventario().map({ item => item.puntosDeVida(self) }).sum() + vidaBase 	}

	method puntosDeAtaqueTotal() {
		return self.inventario().map({ item => item.puntosDeAtaque(self) }).sum() + puntosDeAtaqueBase
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
		return items.any({ item => item.puntosDeAtaque(self) > 0})
	}

	method equiparRuna(runa) {
		runas.add(runa)
		runa.efectoEquipar(self)
		
	}

	method desequiparRuna(runa) {
		runas.remove(runa)
	}

	method tengoRuna() {
		return not runas.isEmpty()
	}

}

