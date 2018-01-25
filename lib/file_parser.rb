require_relative 'file_parsers/text_file_parser'

class FileParser
  FILE_PARSERS = {
    '.txt' => TextFileParser
  }.freeze
  ALLOWED_COMMANDS = ['I', 'L', 'V', 'H', 'S'].freeze

  attr_reader :file, :file_extension, :commands

  def initialize(file)
    @file = file
    validate_file_existance
    @file_extension = File.extname(file)
    validate_file_extension
    @commands = file_parser.new(file).perform
  end

  def perform
    validate_commands
    commands
  end

  private

  def file_parser
    FILE_PARSERS[file_extension]
  end

  def validate_file_existance
    raise 'File could not be found' if file.nil? || !File.exist?(file)
  end

  def validate_file_extension
    raise 'Unsupported file type provided' if FILE_PARSERS[file_extension].nil?
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