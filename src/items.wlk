
import Campeon.*
import Minions.*



class AnilloDeDoran  {

	 method puntosDeVida(campeon)= 60

	 method puntosDeAtaque(campeon) = 15
	 
	 method efectoEquipar(campeon){
	 	 campeon.puntosDeDanio(campeon.puntosDeDanio() +5) 
	}
	
	method efectoDesequipar(campeon){
		
		if( campeon.puntosDeDanio() - 10 < 0) {campeon.puntosDeDanio(0)}
			else{campeon.puntosDeDanio(campeon.puntosDeDanio()-10)}
	}
	


}
class TomoAmplificador  inherits AnilloDeDoran{

	override	method puntosDeVida(campeon) {
		return campeon.puntosDeDanio() * 0.25  
	}

	override	method puntosDeAtaque(campeon) {
	return	campeon.puntosDeDanio() * 0.05 
	}

	
	override	method efectoEquipar(campeon){
		  campeon.bloqueos(campeon.bloqueos() +2)
		  
	}


	override	method efectoDesequipar(campeon) {
		campeon.bloqueos(campeon.bloqueos() + 1)
		campeon.puntosDeDanio(campeon.puntosDeDanio() + 30)
	}

}

class SombreroDeRabadon inherits TomoAmplificador {

	override	method puntosDeVida(campeon) {
		return super(campeon) + 5
	}


	override	method puntosDeAtaque(campeon) {
		return campeon.puntosDeAtaqueBase() *2
	}

	override	method efectoEquipar(campeon){
		super(campeon)
		campeon.puntosDeDanio(campeon.puntosDeDanio()+5)
	}



override	method efectoDesequipar(campeon) {
	} // para que no se pierda el polimorfismo

}
 




// Responder, Responder a todos o Reenviar





