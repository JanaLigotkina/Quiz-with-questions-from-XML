#!/usr/bin/env ruby

require_relative 'lib/question'
require_relative 'lib/quiz'
require_relative 'lib/colorful_output'

include ColorfulOutput

NUMBER_OF_QUESTION_FOR_QUIZ = 3

puts pastel.bold.green("Добро пожаловать в игру 'Викторина'!")
puts "Выберите один из вариантов ответа."

quiz = Quiz.new('data')
quility_points = quiz.start_quiz(NUMBER_OF_QUESTION_FOR_QUIZ)

puts pastel.bold.yellow("Вы набрали #{quility_points} #{quiz.output_declination(quility_points)}.")
