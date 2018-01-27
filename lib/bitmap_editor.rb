require_relative 'command_runner'
require_relative 'file_parser'

class BitmapEditor
  attr_reader :commands

  def initialize(file)
    @commands = FileParser.new(file).commands
  end

  def run
    commands.each do |command|
      bitmap = nil
      bitmap = CommandRunner.new(command, bitmap).perform
    end
  end
end
