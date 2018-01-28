require_relative '../../spec_helper'
require_relative '../../../lib/commands/show_bitmap_command'

RSpec.describe ShowBitmapCommand do
  subject { described_class.new(*args) }

  describe '#perform' do
    let(:bitmap) { Bitmap.new(2, 4) }
    let(:args) { [bitmap] }
    let(:expected_result) { "OOOO\nOPOO\n" }

    it 'should print the bitmap image to stdout' do
      ColourPixelCommand.new(2, 2, 'P', bitmap).perform
      expect { subject.perform }.to output(expected_result).to_stdout
    end
  end
end
