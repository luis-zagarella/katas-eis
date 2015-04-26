class CharCounter
	
	def self.count(un_string)
		dic = Hash.new	
		if (un_string != nil) 
			un_string = un_string.delete(" ")
			un_string.each_char{|c| dic[c] = un_string.count(c)}
		end		
		return dic
	end
end
