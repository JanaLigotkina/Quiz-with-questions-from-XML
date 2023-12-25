#!/usr/bin/env ruby
require "rexml/document"

class Question
	attr_reader :text, :answers, :point

	def initialize(text, answers, point)
		@text = text
		@answers = answers
		@point = point
	end
end
