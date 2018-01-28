class BaseCommand
  def initialize(*args); end

  def validate_command(command_count, *args)
    if command_count.zero? && !(args.count - 1).zero?
      raise 'Too many arguments provided for command'
    end
    raise 'Too many arguments provided for command' if (args.count - 1) > command_count
    raise 'Too few arguments provided for command' if (args.count - 1) < command_count
  end
end
