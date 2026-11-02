class Tarea{

    method recursosProducidos(tiempo) = 50 * (tiempo - self.desgaste(tiempo)) * self.esfuerzo()

    method desgaste(tiempo) 

    method esfuerzo()  
}

class Siembra inherits Tarea {
var property esfuerzo

  method horasDeJornadaNormal()

  override method desgaste(tiempo) = 1 + (tiempo - self.horasDeJornadaNormal()).max(0)
}

class SiembraEnElValle inherits Siembra{
var property epoca 

override method horasDeJornadaNormal() = 8

override  method recursosProducidos(tiempo) = if (epoca.sePuedeSembrar()) super(tiempo)
else 0

}

object epocaSeca {
  method sePuedeSembrar() = true
}

object epocaDeLluvia {
  method sePuedeSembrar() = false
}