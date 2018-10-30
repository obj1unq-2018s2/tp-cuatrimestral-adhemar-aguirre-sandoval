
import Campeon.*
import Minions.*

class Item {

	method puntosDeVida(){
		return 0
	}
	
	method puntosDeAtaque(){
		return 0
	}
	method puntosDeDanio(){
		return 0
	}

	method bloqueos(){
		return 0
	}
	
}

class AnilloDeDoran inherits Item {

	override method puntosDeVida()= 60

	override method puntosDeAtaque() = 15
	override method puntosDeDanio()= 5
	
	/*method darPuntosDeVida(campeon) {
	 * 	campeon.puntosDeVida(campeon.puntosDeVida() + 60)
	 * //		return campeon.puntosDeVida() + 60
	 * }
	 * 
	 * method darPuntosDeAtaque(campeon){
	 * 	campeon.puntosDeAtaque(campeon.puntosDeAtaque()+15)
	 * }
	 * 
	 * method darPuntosDeDanio(campeon){
	 * 	 campeon.puntosDeDanio(campeon.puntosDeDanio()+5)	
	 * }
	
	method efectoEquipar(campeon) {
		self.darPuntosDeVida(campeon)
		self.darPuntosDeAtaque(campeon)
		self.darPuntosDeDanio(campeon)
	} */
	

	// efecto al desequipar el anillo
	method sacarPuntosDeDanio(campeon) {
		campeon.puntosDeDanio(campeon.puntosDeDanio() - 10)
	}

	method efectoDesequipar(campeon) {
		self.sacarPuntosDeDanio(campeon)
	}

}

object tomoAmplificador {

	method darPuntosDeVida(campeon) {
		campeon.puntosDeVida(campeon.puntosDeDanio() * 0.25 + campeon.puntosDeVida())
	}

	method darPuntosDeAtaque(campeon) {
		campeon.puntosDeAtaque(campeon.puntosDeDanio() * 0.05 + campeon.puntosDeAtaque())
	}

	method darBloqueos(campeon, cantB) {
		campeon.bloqueos(campeon.bloqueos() + cantB)
	}

	method efectoEquipar(campeon) {
		self.darPuntosDeVida(campeon)
		self.darPuntosDeAtaque(campeon)
		self.darBloqueos(campeon, 2)
	}

	// efecto al desequipar
	method darPuntosDeDanio(campeon) {
		campeon.puntosDeDanio(campeon.puntosDeDanio() + 30)
	}

	method efectoDesequipar(campeon) {
		self.darPuntosDeDanio(campeon)
		self.darBloqueos(campeon, 1)
	}

}

object sombreroDeRabadon {

	method darPuntosDeVida(campeon) {
		campeon.PuntosDeVida(campeon.puntosDeDanio() * 0.25 + 5 + campeon.puntosDeVida())
	}

	method darPuntosDeAtaque(campeon) {
		campeon.puntosDeAtaque(campeon.puntosDeAtaque() + campeon.puntosDeAtaque() * 0.05 * 2)
	}

	method darPuntosDeDanio(campeon) {
		campeon.darPuntosDeDanio(campeon.darPuntosDeDanio() + 5)
	}

	method darBloqueos(campeon, cantB) {
		campeon.bloqueos(campeon.bloqueos() + cantB)
	}

	method efectoEquipar(campeon) {
		self.darPuntosDeVida(campeon)
		self.darPuntosDeAtaque(campeon)
		self.darPuntosDeDanio(campeon)
		self.darBloqueos(campeon, 2)
	}

	method efectoDesequipar(campeon) {
	} // para que no se pierda el polimorfismo

}

 




// Responder, Responder a todos o Reenviar





