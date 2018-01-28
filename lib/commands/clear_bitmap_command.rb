require_relative 'base_command'

class ClearBitmapCommand < BaseCommand
  attr_reader :bitmap

  def initialize(*args)
    validate_command(0, *args)
    @bitmap = args[0]
  end

  def perform
    bitmap.clear
    bitmap
  end
end
