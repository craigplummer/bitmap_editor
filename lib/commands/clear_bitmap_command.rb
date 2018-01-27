require_relative '../bitmap'
require 'pry'

class ClearBitmapCommand
  attr_reader :bitmap

  def initialize(*args)
    @bitmap = args[0]
  end

  def perform
    bitmap.clear
    bitmap
  end
end