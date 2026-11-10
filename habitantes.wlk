import imperio.*

class Persona {
  var property energia
  
  method resistencia()
  
  method tiempo()
  
  method energiaPerdida(tarea) = tarea.recursosProducidos(
    self.tiempo()
  ) / self.resistencia()
  
  method aplicarTarea(tarea) {
    self.validarTarea(tarea)
    energia -= self.energiaPerdida(tarea)
  }
  
  method validarTarea(tarea) {
    if (! self.puedeHacerTarea(tarea)) self.error("no se puede realizar tarea")
  }
  
  method puedeHacerTarea(tarea) = self.energiaPerdida(tarea) <= energia
}

class PersonaCampesina inherits Persona {
  var property tiempo
  
  override method resistencia() = 10
}

class PersonaDeElite inherits Persona {
  override method tiempo() = 10
  
  override method resistencia() = 12
  
  override method energiaPerdida(tarea) = super(tarea) - 5

  override method puedeHacerTarea(tarea) = super(tarea) || tarea.recursosProducidos(self.tiempo()) > 500
}