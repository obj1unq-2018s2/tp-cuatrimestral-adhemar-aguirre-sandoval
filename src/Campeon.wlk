import Minions.*
import Batalla.*

class Campeon {

	const vidaTotal = 0
	var property puntosDeAtaque = 0
	var property puntosDeDanio = 0
	var property items = []
	var property bloqueos = 0

	method equiparItem(item) {
		items.add(item)
		//item.efectoEquipar(self)
	}

	method desequiparItem(item) {
		if (items.contains(item)) {
			items.remove(item)
			item.efectoDesequipar(self)
		}
	}
	
	method vidaTotal(){	
		var aux 
		if (not (items.isEmpty())){
	   aux = items.map({item=>item.puntosDeVida()}).sum() + vidaTotal	
		}
		else {
			aux = vidaTotal
		}
		 return aux
		}
		
 method 

			
	
	method muereCampeon() {
		return self.vidaTotal() <= self.puntosDeDanio()
	}
	
	/*method atacar(minion){
		minion.puntosDeDanio(minion.puntosDeDanio() + self.puntosDeAtaque()) 
		self.puntosDeDanio(self.puntosDeDanio() + minion.puntosDeAtaque())
	}
	
	method luchar(minion) {
		if (not self.muereCampeon() and not minion.muereMinions() ){
			self.atacar(minion)
		}
	}*/

