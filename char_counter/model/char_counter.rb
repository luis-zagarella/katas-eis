class CharCounter
	
	def self.count(un_string)
		res = Hash.new	
		if (un_string != nil) 
			un_string = un_string.delete(" ")
			un_string.each_char{|c| res[c] = un_string.count(c)}
		end		
		res
end
