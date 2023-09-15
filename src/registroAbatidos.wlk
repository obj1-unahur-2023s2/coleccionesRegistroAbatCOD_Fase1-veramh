object registroAbatidosCOD {
	
}

object reg {
	const registro = []
	
	method agregarAbatidosDia(cantidad ,dia){
		if(self.yaEstaElDia(dia)){
			self.error("Ya existe el dia")
		}
		registro.add([cantidad,dia])
	}
	//method agregarAbatidosVariosDias(registrosAbatidos){
	//	registrosAbatidos.forEach({e => self.agregarAbatidosDia(e)})	
	//}

	//crear metodo para saber si el dia esta en la lista
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia})
	
	method registroDia(dia) = registro.find({r => self.dia(r) == dia})
	
	method dia(reg) = reg.get(1) // esto me trae la posicion en la lista reg
	
	method cant(reg) = reg.first()  // esto me trae el valor del primer elemento de la lista 
	
	method eliminarElRegistroDelDia(dia){
		if(not self.yaEstaElDia(dia)){
			self.error("El dia no esta en la lista")
		}
		registro.remove(self.registroDia(dia))
	}
	
	method eliminarVariosRegistrosDeDias(listaDeDias){
		if (listaDeDias.all({e => self.yaEstaElDia(e)})){
			self.error("Hay dias de la lista que NO estan incluidos en el registro")
		}
		listaDeDias.forEach{e => self.eliminarElRegistroDelDia(e)}
	}
	
	//// consultas
	
	method cantidadDeDiasRegistrados() = registro.size()
	method estaVacioElRegistro() = registro.isEmpty()
	method algunDiaAbatio(cantidad) = registro.any({r => self.cant(r) == cantidad})
	method primerValorDeAbatidos() = registro.first().get(0) // self.cant(egistro.first())  esta es otra opcion
	method ultimoValorDeAbatidos() = self.cant(registro.last())
	method maximoValorDeAbatidos() = registro.max({r => self.cant(r)}) // registro.map({ r => self.cant(r)}).max()
	
	
	
	
	
} 