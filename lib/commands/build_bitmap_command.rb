# frozen_string_literal: true

require_relative '../bitmap'

class BuildBitmapCommand
  attr_reader :width, :height

  def initialize(*args)
    @height = args[0].to_i
    @width = args[1].to_i
    validate_command(*args)
  end

  def perform
    Bitmap.new(width, height)
  end

  def validate_command(*args)
    raise 'Too many arguments provided for command' if args.count - 1 > 2
    raise 'Too few arguments provided for command' if args.count - 1 < 2
  end
end
