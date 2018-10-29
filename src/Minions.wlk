import Campeon.*
import objeto.*
class Minions {
	var property puntosDeVida = 0
	var property puntosDeDanio = 0
	var property puntosDeAtaque = 0
	var property cantidad = 0
	var property plus = 0

	method muereMinions() {
		return self.puntosDeVida() <= self.puntosDeDanio()
	}

	method puntosDeAtaque() {
		return cantidad + plus
	}
	
	method defender(campeon){
	if(campeon.bloqueos()==0)
		{campeon.puntosDeDanio(campeon.puntosDeDanio() + self.puntosDeAtaque())}
		else {
			campeon.bloqueos(campeon.bloqueos() -1)
		}
	}
}
