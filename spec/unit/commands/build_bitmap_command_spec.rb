require_relative '../../spec_helper'
require_relative '../../../lib/commands/build_bitmap_command'

RSpec.describe BuildBitmapCommand do
  subject { described_class.new(*args) }

  describe '#perform' do
    context 'with valid arguments' do
      let(:args) { ['7', '8'] }

      it 'initializes a new bitmap object' do
        expect(Bitmap).to receive(:new).with(7, 8).and_call_original
        subject.perform
      end
    end
  end
end