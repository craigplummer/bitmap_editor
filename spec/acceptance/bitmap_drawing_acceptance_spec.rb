# frozen_string_literal: true

require_relative '../../lib/bitmap_editor.rb'

RSpec.describe 'Drawing a bitmap from a command file' do
  subject { BitmapEditor.new(file).run }

  context 'with no file provided' do
    let(:file) { nil }

    it 'should return an error message' do
      expect { subject }.to raise_error(/File could not be found/)
    end
  end

  context 'with the correct show.txt commands file from examples directory' do
    let(:file) { './examples/show.txt' }
    let(:expected_result) { "OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n" }

    it 'should return the expected output' do
      expect { subject }.to output(expected_result).to_stdout
    end
  end
end
