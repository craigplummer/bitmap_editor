require_relative '../bitmap'
require 'pry'

class ClearBitmapCommand
  attr_reader :bitmap

  def initialize(*args)
    validate_command(*args)
    @bitmap = args[0]
  end

  def perform
    
    bitmap.clear
    bitmap
  end

  def validate_command(*args)
    raise 'Too many arguments provided for command' unless args.count - 1 == 0
  end
end