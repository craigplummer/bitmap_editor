# frozen_string_literal: true

class TextFileParser
  attr_reader :file

  def initialize(file)
    @file = File.open(file)
  end

  def perform
    generate_commands
  end

  private

  def generate_commands
    commands = []
    file.each do |line|
      line = line.chomp.split(' ')
      args = line.drop(1)
      commands << { line[0] => args }
    end
    commands
  end
end
