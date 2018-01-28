require_relative 'colour_pixel_command'
require_relative 'base_command'

class DrawVerticalSegmentCommand < BaseCommand
  attr_reader :x, :y1, :y2, :colour
  attr_accessor :bitmap

  def initialize(*args)
    validate_command(4, *args)
    @x = args[0].to_i
    @y1 = args[1].to_i
    @y2 = args[2].to_i
    @colour = args[3]
    @bitmap = args[4]
    validate_coordinates
  end

  def perform
    (y1..y2).each do |y|
      ColourPixelCommand.new(x, y, colour, bitmap).perform
    end
    bitmap
  end

  def validate_coordinates
    raise 'Y1 needs to be lower than Y2' unless valid_coordinates?
  end

  def valid_coordinates?
    y1 < y2
  end
end
