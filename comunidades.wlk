import imperio.*
import habitantes.*

class Ayllu {
  const colcas = #{}
  
  method agregarColcas(_colcas) {
    colcas.addAll(_colcas)
  }
  
  method mejorColcaPara(habitante) = colcas.max(
    { colca => colca.totalDeRecursosPara(habitante) }
  )
  
  method colcasSuavesPara(habitante) = colcas.filter(
    { colca => colca.hayTareaSuavePara(habitante) }
  )
  
  method tareasMasExigentesPara(habitante) = colcas.map(
    { colca => colca.tareaMasExigentePara(habitante) }
  ).asSet()
}

class Colca {
  const tareas = #{}
  
  method agregarTareas(_tareas) {
    tareas.addAll(_tareas)
  }
  
  method totalDeRecursosPara(habitante) = tareas.sum(
    { tarea => tarea.recursosProducidos(habitante.tiempo()) }
  )
  
  method hayTareaSuavePara(habitante) = tareas.any(
    { tarea => tarea.recursosProducidos(habitante.tiempo()) < 200 }
  )
  
  method tareaMasExigentePara(habitante) = tareas.max(
    { tarea => tarea.recursosProducidos(habitante.tiempo()) }
  )
}