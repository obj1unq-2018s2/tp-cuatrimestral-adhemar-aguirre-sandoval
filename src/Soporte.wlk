import Minions.*
import items.*
import Campeon.*


class Soporte inherits Campeon {
	
	var vinculado = null
	
	// setter
	method vincular(campeon){
		vinculado = campeon
	}
	
	//getter
	method vinculado() = vinculado
	
	// saca el vinculo actual
	method desvincular(campeon) { vinculado = null}
	
	
	
	// ataca y reduce danio al campeon vinculado
	override method atacar(enemigo){
		super(enemigo)
		vinculado.reducirDanio(10)
	}
	
	
	method itemsDeVinculo() = vinculado.items()
	
	override method invetario()=  super() + self.itemsDeVinculo()
