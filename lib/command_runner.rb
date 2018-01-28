require_relative 'commands/build_bitmap_command'
require_relative 'commands/clear_bitmap_command'
require_relative 'commands/colour_pixel_command'
require_relative 'commands/show_bitmap_command'
require_relative 'commands/draw_vertical_segment_command'
require_relative 'commands/draw_horizontal_segment_command'

class CommandRunner
  COMMANDS = {
    'I' => BuildBitmapCommand,
    'L' => ColourPixelCommand,
    'C' => ClearBitmapCommand,
    'S' => ShowBitmapCommand,
    'V' => DrawVerticalSegmentCommand,
    'H' => DrawHorizontalSegmentCommand
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
