#!/usr/bin/env ruby

module QuestionMethods
  def read_from_file(folder_name)
    questions = []

    file_name = File.dirname(__FILE__) + "/../#{folder_name}/questions.xml"

    file = File.new(file_name, 'r:UTF-8') if File.exist?(file_name)
    begin
      doc = REXML::Document.new(file)
    rescue REXML::ParseException => e
      puts "XML file is not valid"
      puts e.message
      exit
    end

    file.close

    doc.elements.each("questions/question") do |item|
      text = item.elements['text'].text
      variants = item.elements['variants'].elements.map do |variant|
        {
          text: variant.text,
          right: variant.attributes["right"] == "true"
        }
      end
      points = item.attributes["points"].to_i

      questions << Question.new(text, variants, points)
    end

    questions
  end
end
