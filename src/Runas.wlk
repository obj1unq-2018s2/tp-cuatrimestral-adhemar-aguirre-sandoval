import Campeon.*
import items.*
import Minions.*

class Runa {

	var property ciudad = new RunaTerra()

	method plusAtaqueRuna(campeon) {
		return self.ciudad().plusAtaque(ciudad, campeon)
	}

	method plusVidaRuna(campeon) {
		return self.ciudad().plusVida(ciudad, campeon)
	}

	method puntosDeVida(campeon) = self.bonificacionPuntosDeVida(campeon) + self.plusVidaRuna(campeon)

	method puntosDeAtaque(campeon) = self.bonificacionPuntosDeAtaque(campeon) + self.plusAtaqueRuna(campeon)
			

	method efectoEquipar(campeon) {
		if (not campeon.tengoRuna()) {
			campeon.equiparRuna(self)
		}
	}

	method bonificacionPuntosDeVida(campeon)

	method bonificacionPuntosDeAtaque(campeon){ return 0}

	method efectoDesequipar(campeon) = campeon.desequiparRuna()

}

class RunasDelColoso inherits Runa {

	override method bonificacionPuntosDeVida(campeon) {
		return campeon.vidaBase() * 0.05
	}

	override method puntosDeVida(campeon) {
		return self.bonificacionPuntosDeVida(campeon)
	}

}

class RunasDelCazador inherits Runa {

	override method bonificacionPuntosDeVida(campeon) = 5

	override method bonificacionPuntosDeAtaque(campeon) {
		if (campeon.tengoItemQueAportaAtque()) {
			return 30
		} else return 0
	}

	override method puntosDeVida(campeon) = self.bonificacionPuntosDeVida(campeon)

}

class RunaHibrida inherits Runa {

	override method bonificacionPuntosDeVida(campeon) = { if (campeon.puntosDeDanio() > campeon.vidaTotal() * 0.5) {
			return campeon.vidaBase() * 0.05
		} else {
			return 5
		}
	}
 	 
}

class RunaTerra {

	method plusAtaque(runa, campeon) = 0

	method plusVida(runa, campeon) = 0

}

class Piltover inherits RunaTerra {

	override method plusVida(runa, campeon) = { if (runa.bonificacionPuntosDeVida(campeon) > 10) {
			20
		}
	}

	override method plusAtaque(runa, campeon) = { if (runa.bonificacionPuntosDeVida(campeon) > 10) {
			10
		}
	}

}

class Noxus inherits RunaTerra {

	override method plusVida(runa, campeon) {
		return 10
	}

	override method plusAtaque(runa, campeon) = { if (runa.bonificacionPuntosDeAtaque(campeon) == 0) {
			15
		}
	}

}

