require_relative '../../lib/bitmap_editor.rb'

RSpec.describe 'Drawing a bitmap from a command file' do
  subject { BitmapEditor.new.run(command_file) }

  context 'with no file provided' do
    let(:command_file) { nil }
    let(:expected_result) { "Please provide a file\n" }

    it 'should return an error message' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end

  context 'with the correct show.txt commands file from examples directory' do
    let(:command_file) { './examples/show.txt' }
    let(:expected_result) { "OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO" }

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end
end
