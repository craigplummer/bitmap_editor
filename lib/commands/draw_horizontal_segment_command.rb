require_relative 'colour_pixel_command'
require 'pry'

class DrawHorizontalSegmentCommand
  attr_reader :y, :x1, :x2, :colour
  attr_accessor :bitmap

  def initialize(*args)
    @x1 = args[0].to_i
    @x2 = args[1].to_i
    @y = args[2].to_i
    @colour = args[3]
    @bitmap = args[4]
    validate_coordinates
  end

  def perform
    (x1..x2).each do |x|
      ColourPixelCommand.new(x, y, colour, bitmap).perform
    end
    bitmap
  end

  def validate_coordinates
    raise 'X1 needs to be lower than X2' unless valid_coordinates?
  end

  def valid_coordinates?
    x1 < x2
  end
end