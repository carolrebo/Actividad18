# Crear una clase llamada Roulette.
# Crear un método de instancia llamado play que reciba como argumento un número
# al cual se está apostando. Luego debe tomar un valor -del array- al azar y
# compararlo con el número al cual se apostó.
# Crear un método de instancia que:
# Debe almacenar el número generado al azar en un archivo llamado
# roulette_history.txt
# Si el número al cual se apostó corresponde al generado al azar entonces,debe además almacenar ese número en un archivo llamado winners.txt
# Crear un método que lea el archivo rouletter_history.txt y retorne el valor que más ha generado la ruleta históricamente

$r = (1..10).to_a
# Crear una clase llamada Roulette.
class Roulette
	def initialize()
		@azar = nil
	end
# Crear un método de instancia llamado play que reciba como argumento un número
	def play(n)
		@azar = $r[rand(10)]
		puts "El numero al azar es #{@azar}"
		almacena(n)
	end	
#Crear un método de instancia que:Debe almacenar el número generado al azar en un archivo llamado roulette_history.txt
	def almacena(n)
		if @azar != nil
			File.open('roulette_history.txt','a'){|file| file.puts(@azar)}
			puts n
			puts @azar
			# Si el número al cual se apostó corresponde al generado al azar entonces,debe además almacenar ese número en un archivo llamado winners.txt
			if n== @azar
				puts "Ganaste"
				File.open('winners.txt','a'){|file| file.puts(@azar)}
			end	
		end	
	end

# Crear un método que lea el archivo rouletter_history.txt y retorne el valor que más ha generado la ruleta históricamente
	def leerArchivo
		numbers = []
		sort = {}
		looper = {}

	    file = File.open('roulette_history.txt','r')
	    data = file.readlines

	    data.each do |n|
	    	numbers.push(n.to_i)
	    end	

	    sort = numbers.group_by{ |value| value}

	    sort.each {|key, value| looper.store(key,value.length)}
	     

	    puts "Veces: #{looper.invert.max[0]} Numero: #{looper.invert.max[1]}"
	end
end

game = Roulette.new
game.play(8)
game.leerArchivo