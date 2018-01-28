# frozen_string_literal: true

require_relative 'colour_pixel_command'

class DrawVerticalSegmentCommand
  attr_reader :x, :y1, :y2, :colour
  attr_accessor :bitmap

  def initialize(*args)
    @x = args[0].to_i
    @y1 = args[1].to_i
    @y2 = args[2].to_i
    @colour = args[3]
    @bitmap = args[4]
    validate_command(*args)
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

  def validate_command(*args)
    raise 'Too many arguments provided for command' if args.count - 1 > 4
    raise 'Too few arguments provided for command' if args.count - 1 < 4
  end

  def valid_coordinates?
    y1 < y2
  end
end
