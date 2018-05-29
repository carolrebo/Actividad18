# Crear una clase Table cuyo constructor reciba el nombre de la mesa y las recaudaciones 
# correspondientes de cada día.
# Crear un método que permita leer el archivo e instanciar una mesa por línea del archivo.
# Crear métodos que permitan:
# - Conocer el mayor valor recaudado, y a que mesa y día corresponde.
# - Calcular el promedio total de lo recaudado por todas las mesas en todos los días.

#  class Table
# 	attr_reader :name, :monto
# 	def initialize(name,*monto)
# 		@name = name
# 		@monto = monto.map { |e| e.to_i }
# 	end

# 	# def self.monto_promedio
# 	# 	@monto.inject(&:+) /@monto.size.to_f
# 	# end

# 	def self.archivo
# 		file = File.open('casino.txt','r')
# 		data = file.readlines
# 		file.close

# 		mesas= []
# 		data.each do |line|
# 			 ls = line.split(', ')
# 			 mesas << Table.new(*ls)
# 		end
# 		mesas
# end
# 		def monto_promedio
# 		@monto.inject(&:+) /@monto.size
# 		end

# 		def maximo
			
# 		end
# end

# a = Table.archivo
# a.each do |x|
# 	puts x.monto_promedio
# end

# r = recaudacion
class Table
  def initialize(nombre, r1, r2, r3, r4)
    @mesa = {}
    @mesa['nombre'] = nombre
    @mesa['values'] = [r1.to_i, r2.to_i, r3.to_i, r4.to_i]
  end

  def promedioR
    @mesa['values'].inject(0) { |sum, valor| sum + valor}/4
  end

  def mayorR
    diaMayor = @mesa['values'].index(@mesa['values'].max)
    [@mesa['nombre'], "Dia #{diaMayor + 1}", @mesa['values'][diaMayor]]
  end
end



def openFile
  file = File.open('casino.txt', 'r')
  data = file.readlines
  file.close
  
  data.each do |index|
    ls = index.split(', ')
    $mesas.push(Table.new(*ls))
  end  
end  

$mesas = []
promedioTotal = 0

openFile

$mesas.each do |mesa|
  print mesa.mayorR
  promedioTotal += mesa.promedioR
end
puts

puts "promedio total de todos los dias y todas las mesas:"
puts promedioTotal/$mesas.count