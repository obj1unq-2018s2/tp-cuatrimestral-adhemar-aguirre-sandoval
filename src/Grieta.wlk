import Campeon.*

object grietaDelInvocador {
	var campeones = []
	
	method agregar(campeon){
		campeones.add(campeon)
	}
	
	method tieneMasVida(){
		var posiciones = campeones.sortedBy({ campeon1,campeon2 => campeon1.vidaTotal() > campeon2.vidaTotal()})
		return posiciones.first()	
	}
	
	method vivos() {
		return campeones.filter({campeon => not campeon.muereCampeon()})
	}
	
	method muertos() {
		return campeones.count({campeon => campeon.estaMuerto()})
	}
	
	method tienenRunas(){
		return campeones.filter({ campeon => campeon.tengoRuna()})
	}
	
}
