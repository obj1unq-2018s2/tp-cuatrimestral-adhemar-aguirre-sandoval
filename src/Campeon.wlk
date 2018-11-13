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
		if (items.contains(item)) {
			item.habilidadActivada(self)
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

	method atacar(minion) {
		minion.puntosDeDanio(minion.puntosDeDanio() + self.puntosDeAtaqueTotal())
		cantDinero = cantDinero + (self.puntosDeAtaqueTotal() - minion.cantidad() )
	}

	method luchar(minion) {
		if (not self.muereCampeon() and not minion.estaMuerto()) {
			minion.defender(self)
			self.atacar(minion)
			minion.reciboDanio(minion.puntosDeDanio())
		} else {
			not self.muereCampeon() and minion.estaMuerto()
			self.atacar(minion)
		}
	}
	
		method atacarEjercito(ejercito){
		ejercito.recibeAtaque(self.puntosDeAtaqueTotal())
	}
	
	method lucharEjercito(ejercito){
		if(not self.muereCampeon() and not ejercito.ejercitoMuerto()){
			ejercito.defenderse(self)
			self.atacarEjercito(ejercito)}	
		else{not self.muereCampeon() and ejercito.ejercitoMuerto() self.atacarEjercito(ejercito)}
	}
}



