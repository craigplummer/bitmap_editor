require_relative '../bitmap'

class BuildBitmapCommand
  attr_reader :width, :height

  def initialize(*args)
    @height = args[0].to_i
    @width = args[1].to_i
  end

  def perform
    Bitmap.new(width, height)
  end
end