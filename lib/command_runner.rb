require 'commands/build_bitmap_command'
require 'pry'

class CommandRunner
  COMMANDS = {
    'I' => BuildBitmapCommand
  }.freeze

  attr_reader :command, :args

  def initialize(command)
    @command = command.keys[0]
    @args = command[@command]
  end

  def perform
    COMMANDS[command].new(*args).perform
  end
end