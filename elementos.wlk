import plagas.*
class Elemento{
  method esBueno()
  method recibirAtaque(unaPlaga)
}
class Hogar inherits Elemento{
  var nivelDeMugre 
  const confort
  override method esBueno() = (nivelDeMugre) <= (confort/2)

  
  override method recibirAtaque(unaPlaga){
    nivelDeMugre += unaPlaga.nivelDeDanio()
  }
}
class Huerta inherits Elemento{
  var capacidadDeProduccion
  var property nivel = 40
  override method esBueno() = capacidadDeProduccion > nivel 

  
  override method recibirAtaque(unaPlaga){
    capacidadDeProduccion = 
      0.max(capacidadDeProduccion - (unaPlaga.nivelDeDanio() * 0.1 + if(unaPlaga.trasmiteEnfermedades()) 10 else 0))
  }
}
class Mascota inherits Elemento{
  var nivelDeSalud
  override method esBueno() = nivelDeSalud > 250

  override method recibirAtaque(unaPlaga){
    if(unaPlaga.trasmiteEnfermedades()){
      nivelDeSalud = 0.max(nivelDeSalud - unaPlaga.nivelDeDanio())
    }
  }
}

class Barrio{
  const elementos = #{}
  method agregarElemento(unElemento){
    elementos.add(unElemento)
  }
  method quitarElemento(unElemento){
    elementos.remove(unElemento)
  }
  method agregarElementos(listaDeElementos){
    elementos.addAll(listaDeElementos)
  }

  method cantidadDeElementosBuenos() = elementos.count({elemento => elemento.esBueno()})
  method cantidadDeElementosMalos() = elementos.count({elemento => not elemento.esBueno()})

  method esCopado() = self.cantidadDeElementosBuenos() > self.cantidadDeElementosMalos()
}

