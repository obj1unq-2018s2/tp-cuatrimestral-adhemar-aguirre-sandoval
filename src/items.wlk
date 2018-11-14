import Campeon.*
import Minions.*

class AnilloDeDoran {

	method precio() = 300

	method puntosDeVida(campeon) = 60

	method puntosDeAtaque(campeon) = 15

	method efectoEquipar(campeon) {
		campeon.puntosDeDanio(campeon.puntosDeDanio() + 5)
	}

	method efectoDesequipar(campeon) {
		if (campeon.puntosDeDanio() - 10 < 0) {
			campeon.puntosDeDanio(0)
		} else {
			campeon.puntosDeDanio(campeon.puntosDeDanio() - 10)
		}
	}

}

class TomoAmplificador inherits AnilloDeDoran {

	var habilidad = 1

	method habilidadActivada(campeon) {
		if (habilidad == 1) {
			self.otorgarDineroA(campeon)
			habilidad = 0
		}
	}

	method otorgarDineroA(campeon) {
		if (campeon.cantDinero() < 500) {
			campeon.cantDinero(500)
		}
	}

	override method precio() = 500

	override method puntosDeVida(campeon) {
		return campeon.puntosDeDanio() * 0.25
	}

	override method puntosDeAtaque(campeon) {
		return campeon.puntosDeDanio() * 0.05
	}

	override method efectoEquipar(campeon) {
		campeon.bloqueos(campeon.bloqueos() + 2)
	}

	override method efectoDesequipar(campeon) {
		campeon.bloqueos(campeon.bloqueos() + 1)
		campeon.puntosDeDanio(campeon.puntosDeDanio() + 30)
	}

}

class SombreroDeRabadon inherits TomoAmplificador {

	override method precio() = super() + 100

	override method puntosDeVida(campeon) {
		return super(campeon) + 5
	}

	override method puntosDeAtaque(campeon) {
		return campeon.puntosDeAtaqueBase() * 2
	}

	override method efectoEquipar(campeon) {
		super(campeon)
		campeon.puntosDeDanio(campeon.puntosDeDanio() + 5)
	}

	override method efectoDesequipar(campeon) {
	} // para que no se pierda el polimorfismo

}

class PocionDeVida {

	var uso = 2

	method precio() = 50

	method efectoDesequipar(campeon) {
	}

	method efectoEquipar(campeon) {
	}

	method habilidadActivada(campeon) {
		if (uso > 0) {
			self.descontarDanio(campeon)
			uso -= 1
		}
	}

	method descontarDanio(campeon) {
		campeon.quitarPuntosDeDanio(50)
//		if (campeon.puntosDeDanio() >= 50) {
//			campeon.puntosDeDanio(campeon.puntosDeDanio() - 50)
//		} else {
//			campeon.puntosDeDanio(0)
//		}
	}

}

class BastonDelVacio {

	const materiales = []

	method precio() = 0

	method efectoDesequipar(campeon) {
	}

	method efectoEquipar(campeon) {
	}

	method cargarMateriales(item) {
		materiales.add(item)
	}

	method puntosDeVida(campeon) {
		return materiales.sum({ material => material.puntosDeVida() }) * 0.5
	}

	method puntosDeAtaque() {
		materiales.sum({ material => material.puntosDeAtaque()})
	}

	method habilidadActivada(campeon) {
		materiales.forEach({ material => material.habilidadActivada(campeon)})
	}

}

