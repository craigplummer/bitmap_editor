

require_relative '../bitmap'
require_relative 'base_command'

class BuildBitmapCommand < BaseCommand
  attr_reader :width, :height

  def initialize(*args)
    validate_command(2, *args)
    @height = args[0].to_i
    @width = args[1].to_i
  end

  def perform
    Bitmap.new(width, height)
  end
end
