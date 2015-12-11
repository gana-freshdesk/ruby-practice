require 'pry'
class Maze
	attr_reader :maze

	def initialize(maze_as_str)
		@maze = Array.new { Array.new }
		@ai = nil
		@aj = nil
		@bi = nil
		@bj = nil
		@steps = 0
		@M = 0
		
		maze_as_str.each_line do |line|
			#puts line
			if @N == nil
				@N = line.length
			end

			if @ai == nil
				a = line.index("A")
				if a != nil
					@ai = @maze.length
					@aj = a
				end
			end

			if @bi == nil
				b = line.index("B")
				if b != nil
					@bi = @maze.length
					@bj = b
				end
			end
			@maze[@maze.length] = line.each_char.to_a
			@M += 1
		end
	end

	

	def solvable?
		#puts "Length of maze : "
		#puts @maze.length
		return is_solvable(@ai, @aj)
	end

	private
	def safe?(i, j)
		if i >= 0 && i < @M && j >=0 && j < @N && @maze[i][j] != '#'
			return true
		else
			return false
		end
	end

	def is_solvable(ai, aj)
		#puts "Solvable : " , ai, aj
		
		if ai == @bi && aj == @bj
			return true
		end

		if safe?(ai, aj)
			@maze[ai][aj] = '#'

			if is_solvable(ai + 1, aj)
				return true
			end
			if is_solvable(ai, aj + 1)
				return true
			end
			if is_solvable(ai - 1, aj)
				return true
			end
			if is_solvable(ai, aj - 1)
				return true
			end

			@maze[ai][aj] = 'a'
			return false
		end
		return false
	end
end

MAZE1 = %{#####################################
# #   #     #A        #     #       #
# # # # # # ####### # ### # ####### #
# # #   # #         #     # #       #
# ##### # ################# # #######
#     # #       #   #     # #   #   #
##### ##### ### ### # ### # # # # # #
#   #     #   # #   #  B# # # #   # #
# # ##### ##### # # ### # # ####### #
# #     # #   # # #   # # # #       #
# ### ### # # # # ##### # # # ##### #
#   #       #   #       #     #     #
#####################################}

MAZE2 = %{#####################################
# #       #             #     #     #
# ### ### # ########### ### # ##### #
# #   # #   #   #   #   #   #       #
# # ###A##### # # # # ### ###########
#   #   #     #   # # #   #         #
####### # ### ####### # ### ####### #
#       # #   #       # #       #   #
# ####### # # # ####### # ##### # # #
#       # # # #   #       #   # # # #
# ##### # # ##### ######### # ### # #
#     #   #                 #     #B#
#####################################}

MAZE3 = %{#####################################
# #   #           #                 #
# ### # ####### # # # ############# #
#   #   #     # #   # #     #     # #
### ##### ### ####### # ##### ### # #
# #       # #  A  #   #       #   # #
# ######### ##### # ####### ### ### #
#               ###       # # # #   #
# ### ### ####### ####### # # # # ###
# # # #   #     #B#   #   # # #   # #
# # # ##### ### # # # # ### # ##### #
#   #         #     #   #           #
#####################################}


#m = Maze.new("helAlo \n world \n rBuby is\nennavo")
m = Maze.new(MAZE1)
puts m.solvable?
