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
			show_question(question)

			user_answer = get_user_answer(question.answers.size)

			if correct_answer?(question, user_answer)
				puts pastel.bold.green("Верно!\n")
				number_of_points += question.point
			else
				puts pastel.bold.red("Неправильно! Правильный ответ: #{right_variant(question)}\n")
			end
		end

		number_of_points
	end

	def output_declination(quantity)
		declination = case quantity % 100
					when 11..20 then 'баллов'
					when 2..4   then 'балла'
					else               'балл'
					end
		declination
	end

	private

	def show_question(question)
		puts pastel.bold.green(question.text)

		puts "Варианты ответа:"
		question.answers.each_with_index do |answer, index|
			puts "#{index + 1}. #{answer[:text]}"
		end
	end

	def get_user_answer(size)
		user_answer = nil
		until (1..size).include?(user_answer)
			puts "Введите число от 1 до #{size}:"
			user_answer = STDIN.gets.to_i
		end
		user_answer
	end

	def correct_answer?(question, user_answer)
		question.answers[user_answer - 1][:right] == true
	end

	def right_variant(question)
		index = question.answers.find_index { |answer| answer[:right] == true }
		question.answers[index][:text]
	end
end 	
