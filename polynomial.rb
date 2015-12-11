class Polynomial
	attr_reader :p_str
	
	def initialize(a)
		len = a.length
		@p_str = String.new
		
		if len < 2
			raise ArgumentError.new("Need atleast 2 coefficients")
		end

		i = 1
		a.each do |coeff|
			#puts coeff
			if coeff == 0
				i += 1
				next
			end	
			
			power = len - i			
			if power > 1
				temp = "x" + "^" + (len-i).to_s
			elsif power == 1
				temp = "x"
			else
				temp = ""
			end

			#puts "temp : " + temp
			
			c = ""
			if coeff < 0
				c = "-"
			elsif i > 1
					c = "+"
			end

			
			if coeff.abs > 1 || (coeff.abs == 1 && power == 0)
				c += coeff.abs.to_s
			end
			temp.prepend(c)
			#puts "temp : " + temp
			@p_str += temp
			i += 1 
		end
		puts p_str
	end
end

Polynomial.new([3, -4, 1, 0, 6])


