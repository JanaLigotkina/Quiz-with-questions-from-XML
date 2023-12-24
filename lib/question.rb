#!/usr/bin/env ruby
require "rexml/document"

class Question
	attr_reader :text, :answers, :point, :timeline

	def initialize(text, answers, point, timeline)
		@text = text
		@answers = answers
		@point = point
		@timeline = timeline
	end
end
