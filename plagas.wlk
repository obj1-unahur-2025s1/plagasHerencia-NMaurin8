import elementos.*

class Plaga{
    var poblacion 
    
    method nivelDeDanio()
    method trasmiteEnfermedades() = poblacion >= 10

    method atacar(unElemento){
        unElemento.recibirAtaque(self)
        poblacion += poblacion * 0.1
    }
}

class Cucarachas inherits Plaga{
    var property pesoPromedio
    override method nivelDeDanio() = poblacion/2
    override method trasmiteEnfermedades() = super() and pesoPromedio >= 10

    override method atacar(unElemento){
        super(unElemento)
        pesoPromedio += 2
    }
}


class Pulga inherits Plaga{
    override method nivelDeDanio() = poblacion * 2
    
}

class Garrapatas inherits Pulga{

    override method atacar(unElemento){
        unElemento.recibirAtaque(self)
        poblacion += poblacion * 0.2
    }
}

class Mosquitos inherits Plaga{
    override method nivelDeDanio() = poblacion

    override method trasmiteEnfermedades() = super() and poblacion % 3 == 0 
}


