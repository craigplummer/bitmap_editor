class TextFileParser
  attr_reader :file
  attr_accessor :commands

  ALLOWED_COMMANDS = ['I', 'L', 'V', 'H', 'S']

  def initialize(file)
    @file = File.open(file)
    @commands = []
  end

  def perform
    commands = generate_commands
    validate_commands
    commands
  end

  private

  def generate_commands
    file.each do |line|
      line = line.chomp.split(' ')
      args = line.drop(1)
      commands << { line[0] => args }
    end
    commands
  end

  def validate_commands
    commands_valid?
    raise 'First command must be I' unless commands[0].keys[0] == 'I'
  end

  def commands_valid?
    # TODO: Tidy this up
    commands.each do |command|
      raise 'Unknown command specified' unless ALLOWED_COMMANDS.include?(command.keys[0])
    end
  end
end