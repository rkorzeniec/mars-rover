#!/usr/bin/env ruby
require './lib/planet'
require './lib/rover'

#allow user to create a custom sized planet
custom_planet = false
ARGV.each do|a|
  if a == "custom"
  	custom_planet = true
  	break
  end
end

#user wants to create custom sized planet
if custom_planet
	puts "What is the planet size (X, Y)? e.g. 50 49"
	planet_size = STDIN.gets
	planet_size = planet_size.split(" ")
end

puts "What is the location of the rover? e.g. 3 5 N"
rover_location = STDIN.gets
rover_location.upcase!
rover_location = rover_location.split(" ")

planet = Planet.new(planet_size[0], planet_size[1])
rover = MarsRover.new(planet, rover_location[2], [rover_location[0], rover_location[1]])

#loop control variable
quit = false
until quit 
	puts "Move rover [L(eft), R(ight), F(orwards), B(backwards), S(tatus), Q(uit)]: "
	input = STDIN.gets
	input = input.split(" ")

	input.each do |action|
		action.upcase!
		if action == "S"
			print %x{clear}
			puts rover.to_s
			puts planet.to_s(rover.location[:x], rover.location[:y])
		elsif action == "Q"
			quit = true
			puts "Bye!"
		else
			print %x{clear}
			rover.input(action)
		end
	end
end