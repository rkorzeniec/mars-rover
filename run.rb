#!/usr/bin/env ruby
require './lib/planet'
require './lib/rover'

#puts "What is the planet size? e.g. 50 49"
#planet_size = gets.chomp
#planet_size = planet_size.split(" ")
#print planet_size

#puts "What is the location of the rover? e.g. 3 5 N"
#rover_location = gets.chomp
#rover_location = rover_location.split(" ")
#print rover_location

#planet = Planet.new(planet_size[0], planet_size[1])
planet = Planet.new
#rover = MarsRover.new(planet, rover_location[2], [rover_location[0], rover_location[1]])
rover = MarsRover.new(planet)

loop do
	puts "Move rover [L(eft), R(ight), F(orwards), B(backwards), S(tatus)]: "
	input = gets.chomp
	input = input.split(" ")

	input.each do |action|
		action.upcase!
		if action == "S"
			print %x{clear}
			puts rover.to_s
			puts planet.to_s
			print "#{planet.obstacles} \n"
		elsif action == "Q"
			
		else
			print %x{clear}
			rover.input(action)
		end
	end
end