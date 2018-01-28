require_relative '../spec_helper'
require_relative '../../lib/command_runner'
require_relative '../../lib/bitmap'

RSpec.describe CommandRunner do
  subject { described_class.new(command, bitmap) }
  

  describe '#perform' do
    context 'with I command' do
      let(:command) { { 'I' => ['3', '5']} }
      let(:bitmap) { nil }

      it 'initializes new BuildBitmapCommand' do
        expect(BuildBitmapCommand).to receive(:new).with('3', '5', nil).and_call_original
        subject.perform
      end
    end

    context 'with C command' do
      let(:command) { { 'C' => []} }
      let(:bitmap) { Bitmap.new(3, 4) }

      it 'initializes new ClearBitmapCommand' do
        expect(ClearBitmapCommand).to receive(:new).with(bitmap).and_call_original
        subject.perform
      end
    end

    context 'with S command' do
      let(:command) { { 'S' => []} }
      let(:bitmap) { Bitmap.new(3, 4) }

      it 'initializes new ClearBitmapCommand' do
        expect(ShowBitmapCommand).to receive(:new).with(bitmap).and_call_original
        subject.perform
      end
    end

    context 'with L command' do
      let(:command) { { 'L' => ['2', '3', 'P'] } }
      let(:bitmap) { Bitmap.new(3, 4) }

      it 'initializes new ColourPixelCommand' do
        expect(ColourPixelCommand).to receive(:new).with('2', '3', 'P', bitmap).and_call_original
        subject.perform
      end
    end

    context 'with H command' do
      let(:command) { { 'H' => ['1', '2', '3', 'P'] } }
      let(:bitmap) { Bitmap.new(5, 5) }

      it 'initializes new DrawHorizontalSegmentCommand' do
        expect(DrawHorizontalSegmentCommand).to receive(:new).with('1', '2', '3', 'P', bitmap).and_call_original
        subject.perform
      end
    end
  end
end