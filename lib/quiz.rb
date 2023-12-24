#!/usr/bin/env ruby

require_relative 'question_methods'
require_relative 'colorful_output'

class Quiz
	include QuestionMethods
	include ColorfulOutput

	def initialize(folder_name)
		@questions = read_from_file(folder_name)
	end

	def start_quiz(number_of_question)
		number_of_points = 0

		@questions.shuffle.sample(number_of_question).each do |question|
			puts pastel.bold.green(question.text)

			puts "Варианты ответа:"
			question.answers.each_with_index do |answer, index|
				puts "#{index + 1}. #{answer[:text]}"
			end

			user_answer = STDIN.gets.to_i until (1..question.answers.size).include?(user_answer)

			if question.answers[user_answer - 1][:right] == true
				puts pastel.bold.green("Верно!\n")
				number_of_points += question.point
			else
				puts pastel.bold.red("Неправильно! Правильный ответ: #{right_variant(question)}")
			end
		end

		number_of_points
	end

	def right_variant(question)
		index = question.answers.find_index { |answer| answer[:right] == true }
		question.answers[index][:text]
	end
end 	
