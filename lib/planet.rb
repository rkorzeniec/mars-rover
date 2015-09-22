class Planet
	attr_reader :x, :y, :obstacles

	def initialise(x = 30, y = 30)
		@x = x
		@y = y
		@obstacles = Array.new
		i = 0
		rand(5...x).each do
			rand_x = rand(0...x)
			rand_y = rand(0...y)
			unless obstacle_at?(rand_x, rand_y)
				obstacle[i] = [rand_x, rand_y]
				i += 1
			end
		end
	end

	def obstacle_at?(x, y)
		isObstacle = false
		@obstacles.each do |obstacle|
			if obstacle[:x] == x && obstacle[:y] == y
				isObstacle = true
				break
			end
		end
	end

	def actual_location(x, y)
		new_x = case x 
			when x > @x then 0
			when x < 0 then @x
			else x
		end

		new_y = case y 
			when y > @y then 0
			when y < 0 then @y
			else y
		end
	end

	def to_s(rover_x, rover_y)
		planet = "Size -> x:#{@x} y:#{@y}\n\n"
		for i = @y in @y..0
			planet += "#{i} |"
			for j = @x in 0..@x
				if obstacle_at?(j, i)
					planet += "O"
				elsif j == rover_x && i == rover_y
					planet += "R"
				else
					planet += "-"
				j += 1
			end
			planet += "\n"
			i -= 1
		end
	end
end