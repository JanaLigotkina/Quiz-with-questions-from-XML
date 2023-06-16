class Question
	attr_reader :text, :variants, :point, :minutes

	def initialize(params)
		@text = params[:text]
		@variants = params[:variants]
		@point = params[:points]
		@minutes = params[:minutes]
	end 	

	def answer_options
		answer_options = []

		variants.elements.each do |item|
			answer_options << item.text 
		end

		answer_options
	end 

	def right_answer_index
		variants.elements.each_with_index do |item, index|
			index if item.attributes.include?("right")  
		end
	end  	
end 	