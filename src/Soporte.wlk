import Minions.*
import items.*
import Campeon.*


class Soporte inherits Campeon {
	
	var vinculado = null
	
//	override method cantDinero() = 100
	// setter
	method vincular(campeon){
		vinculado = campeon
	}
	
	//getter
	method vinculado() = vinculado
	
	// saca el vinculo actual
	method desvincular(campeon) { vinculado = null}
	
	// metodos que faltaban 
	override method vidaTotal() = vidaBase + self.inventario().sum({ item => item.puntosDeVida(self)})
	
	override method puntosDeAtaqueTotal() = puntosDeAtaqueBase + self.inventario().sum({ item => item.puntosDeAtaque(self)})
	
	// ataca y reduce danio al campeon vinculado
	override method atacar(enemigo){
		super(enemigo)
		vinculado.reducirDanio(10)
	}
	
	
	method itemsDeVinculo() = vinculado.items()
	
	override method inventario() = super() +  self.itemsDeVinculo()
}
