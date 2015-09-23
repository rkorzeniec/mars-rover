class Planet
	attr_reader :x, :y, :obstacles

	def initialize(x = 30, y = 30)
		#initialise class' main attributes
		@x = x.to_i
		@y = y.to_i
		@obstacles = Array.new

		#generate random obstacles
		i = 0
		num = rand(10..60)
		num.times do
			rand_x = rand(0..30)
			rand_y = rand(0..30)
			unless obstacle_at?(rand_x, rand_y)
				@obstacles[i] = [rand_x, rand_y]
				i += 1
			end
		end
	end

	#check if obstacle exsists at a given point
	def obstacle_at?(x, y)
		isObstacle = false
		if @obstacles.include?([x, y])
			isObstacle = true
		end

		return isObstacle
	end

	#implementation of grid (sphere-like) wrapping
	def actual_location(x, y)
		if x > (@x - 1)
			new_x = 0
		elsif x < 0 
			new_x = (@x - 1)
		else
			new_x = x
		end

		if y > (@y - 1)
			new_y = 0
		elsif y < 0 
			new_y = (@y - 1)
		else
			new_y = y
		end

		return new_x, new_y
	end

	#draw map of the planet with grid, obstacles and rover position
	def to_s(rover_x, rover_y)
		grid = "Planet | x:#{@x} y:#{@y}\n\n"

		#loop through Y axis to crate the grid
		j = @y - 1
		(@y + 2).times do
			if j >= 0
				grid += "#{j}"
				if j > 9
					grid += " |"
				else
					grid += "  |"
				end
			else
				grid += "   |"
			end

			#loop through X axis to fill the grid with neccessary objects
			i = 0
			@x.times do 
				if j >= 0
					if obstacle_at?(i, j)
						grid += " O  "
					elsif i == rover_x && j == rover_y
						grid += " R  "
					else
						grid += " -  "
					end	
				elsif j == -1
					grid += "____"
				elsif i < 10
					grid += " #{i}  "
				else
					grid += " #{i} "
				end
				i += 1
			end
			j -= 1
			grid += "\n"
		end
		grid += "\n"
		return grid
	end
end