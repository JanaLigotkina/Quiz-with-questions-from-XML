require 'rexml/document'
require_relative 'lib/question'
require_relative 'lib/quiz'

# Делаем массив вопросов 
questions = Quiz.read_file(File.dirname(__FILE__) + '/questions.xml')

quiz = Quiz.new(questions)

puts 'Добро пожаловать в викторину!'

quiz.selected_questions.each_with_index() do |question, index|
	puts question.text

	question.answer_options.each_with_index() do |answer, i|
		puts "#{i + 1}. #{question.answer_options[i]}" 
	end 	
	
	puts "Введите номер ответа:"
	choise = gets.to_i

	if (choise - 1) == question.right_answer_index 
		quiz.update_guessed_scores(question)
		puts "Верно, количество правильных ответов: #{quiz.guessed}, количество баллов: #{quiz.scores}"
	else 
		puts "Неправильно! Правильный ответ под номером #{question.right_answer_index + 1}"
		puts "Общее количество баллов на данный момент: #{quiz.scores}, количество верных ответов: #{quiz.guessed}"
	end	
end	

puts "\nИгра закончена"
puts "Общее количество набранных баллов: #{quiz.scores}, общее количество правильных ответов: #{quiz.guessed} вопросов" 
