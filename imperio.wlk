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

class SiembraEnTerraza inherits Siembra{
  override method horasDeJornadaNormal() = 6

  override  method recursosProducidos(tiempo) = super(tiempo) * 3
}

class Mensaje inherits Tarea {
   override method esfuerzo() = 1.4

   override method desgaste(tiempo) = tiempo/4
}

class MensajeImperial inherits Mensaje{
   override method esfuerzo() = 1.8

   override method desgaste(tiempo) = (super(tiempo) - 2).max(1)
}