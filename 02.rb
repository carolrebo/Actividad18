# Crear una clase Course cuyo constructor reciba el nombre y las fechas de inicio y
# termino de cada curso.
# Crear un método que permita leer el archivo e instanciar una alum por línea del
# archivo.
# Crear métodos que permitan:
# Saber qué cursos comienzan previo a una fecha entregada como
# argumento.
# Saber qué cursos finalizan posterior a una fecha entregada como
# argumento.
# En ambos el métodos argumento por defecto debe ser la fecha
# de hoy.
# Ambos métodos deben levantar una excepción si la fecha
# recibida es >= 2018-01-01.


require 'date'

class Course
  def initialize(nombre, fecha_inicio, fecha_termino)
    @nombre = nombre
    @fecha_inicio = Date.parse(fecha_inicio)
    @fecha_termino = Date.parse(fecha_termino)
  end

  def Previo(fecha = Date.today)
    if fecha > Date.parse('2018-12-25')
      raise ArgumentError, 'Fecha posterior al 2018-01-01'
    else
      if fecha < @fecha_inicio
        return true
      else
        return false
      end
    end
  end

  def Posterior(fecha = Date.today)
    if fecha > Date.parse('2018-12-25')
      raise ArgumentError, 'Fecha posterior al 2018-01-01'
    else
      if fecha < @fecha_termino
        return true
      else
        return false
      end
    end
  end
end

def openFile
  file = File.open('cursos.txt','r')
  data = file.readlines
  ls = []
  data.each do |line|
     ls = line.split(', ')
     $cursos.push(Course.new(*ls))
  end 
end 

$cursos = []
openFile

$cursos.each do |curso|
  puts curso.Previo(Date.parse('2017-01-01'))
end