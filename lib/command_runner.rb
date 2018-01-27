require_relative 'commands/build_bitmap_command'
require_relative 'commands/clear_bitmap_command'
require 'pry'

class CommandRunner
  COMMANDS = {
    'I' => BuildBitmapCommand,
    'C' => ClearBitmapCommand
  }.freeze

  attr_reader :command, :args

  def initialize(command, bitmap = nil)
    @command = command.keys[0]
    @args = command[@command]
    @args << bitmap
  end

  def perform
    COMMANDS[command].new(*args).perform
  end
end