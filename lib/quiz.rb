class Quiz

	# количество вопросов в викторине 
	NUMBER_OF_QUESTION = 3

	attr_reader :selected_questions, :number_of_question
    attr_accessor :guessed, :scores

	# статический метод, так как он не относится к этому классу 
	def self.read_file(file_path)
		questions = []
		file = File.new(file_path)

		# Считываем вопросы из xml файла и создаем массив вопросов
		REXML::Document.new(file).elements.each("questions/question") do |item|
			questions << Question.new(
				text: item.elements['text'].text,
				variants: item.elements['variants'],
				# rigth_variants: item.elements['variants'].attributes[""]
				minutes: item.attributes["minutes"].to_i,
				points: item.attributes["points"].to_i
				)
		end	

		return questions
	end

	def initialize(questions)
		@selected_questions = questions.sample(NUMBER_OF_QUESTION) # Выбранные случайным образом вопросы
		@scores = 0 # баллы
		@guessed = 0 # Счетчик правильных ответов
		@number_of_question = NUMBER_OF_QUESTION # Количество вопросов в викторине
	end  	

	def update_guessed_scores(question)
		@guessed += 1
		@scores += question.point
	end 	
end 	