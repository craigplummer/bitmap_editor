require_relative '../spec_helper'
require_relative '../../lib/command_runner'

RSpec.describe CommandRunner do
  subject { described_class.new(command) }

  describe '#perform' do
    context 'with I command' do
      let(:command) { { 'I' => ['3', '5']} }

      it 'initializes new BuildBitmapCommand' do
        expect(BuildBitmapCommand).to receive(:new).with('3', '5').and_call_original
        subject.perform
      end
    end
  end
end