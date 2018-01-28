require_relative 'command_runner'
require_relative 'file_parser'

class BitmapEditor
  attr_reader :commands

  def initialize(file)
    @commands = FileParser.new(file).perform
  end

  def run
    bitmap = nil
    commands.each do |command|
      bitmap = CommandRunner.new(command, bitmap).perform
    end
  end
end
