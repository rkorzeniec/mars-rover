class MarsRover
	attr_accessor :direction, :location
	def initialise(planet, direction, start_location)
		@planet = planet
		@direction = direction
		@location = { x: start_location.x, y: start_location.y }
	end

	def input(action)
		case action
			when 'L' then turn_left
			when 'R' then turn_right
			when 'F' then move_forwards
			when 'B' then move_backwards
		end
	end

	def to_s
		"X: #{@location[:x]} Y: #{@location[:y]} Direction: #{@direction}"
	end

	private
		def move_forwards
			coordinates = case @direction
		      when 'N' then [0, 1]
		      when 'S' then [0, -1]
		      when 'E' then [1, 0]
		      when 'W' then [-1, 0]
		    end

		    new_x = @location[:x] + coordinates[0]
		    new_y = @location[:y] + coordinates[1]

		    move(new_x, new_y)
		end

		def move_backwards
			coordinates = case @direction
		      when 'N' then [0, -1]
		      when 'S' then [0, 1]
		      when 'E' then [-1, 0]
		      when 'W' then [1, 0]
		    end

		    new_x = @location[:x] + coordinates[0]
		    new_y = @location[:y] + coordinates[1]

		    move(new_x, new_y)
		end

		def move(x, y)

		end

		def turn_left
			@direction  = case @direction
				when 'N' then 'E'
				when 'S' then 'W'
				when 'E' then 'S'
				when 'W' then 'N'
			end
		end

		def turn_right
			@direction = case @direction
				when 'N' then 'W'
				when 'S' then 'E'
				when 'E' then 'N'
				when 'W' then 'S'
			end
		end
end

module 