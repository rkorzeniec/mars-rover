class Planet
	attr_reader :x, :y, :obstacles

	def initialize(x = 30, y = 30)
		@x = x
		@y = y
		@obstacles = Array.new

		i = 0
		num = rand(5..30)
		num.times do
			rand_x = rand(0..30)
			rand_y = rand(0..30)
			unless obstacle_at?(rand_x, rand_y)
				@obstacles[i] = [rand_x, rand_y]
				i += 1
			end
		end
		#print "#{@obstacles} \n"
	end

	def obstacle_at?(x, y)
		isObstacle = false
		if @obstacles.include?([x, y])
			isObstacle = true
		end

		return isObstacle
	end

	def actual_location(x, y)
		if x > @x
			new_x = 0
		elsif x < 0 
			new_x = @x
		else
			new_x = x
		end

		if y > @y
			new_y = 0
		elsif y < 0 
			new_y = @y
		else
			new_y = y
		end

		return new_x, new_y
	end

	def to_s()
		planet = "Size -> x:#{@x} y:#{@y}\n\n"
		
		# i = 29
		# j = 0

		# 30.times do
		# 	if i < 10 
		# 		planet += "#{i}  |"
		# 	else 
		# 		planet += "#{i} |"
		# 	end
		# 	30.times do
		# 		if obstacle_at?(j, i)
		# 			planet += " O "
		# 		#elsif j == rover_x && i == rover_y
		# 			#planet += "R"
		# 		else
		# 			planet += " - "
		# 		end
		# 		j += 1
		# 	end

		# 	planet += "\n"
		# 	i -= 1
		# end
		# 31.times do
		# 	planet += "___"
		# end
		# i = 0
		# planet += "\n   "
		# 30.times do
		# 	planet += "#{i}"
		# 	i += 1
		# end

		return planet
	end
end