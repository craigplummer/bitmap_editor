

require_relative '../../lib/bitmap_editor.rb'
require 'pry'

RSpec.describe 'Invalid Input Examples' do
  subject { BitmapEditor.new(file).run }

  let(:file) do
    Tempfile.new(['input', '.txt']).tap do |file|
      file.write(input)
      file.rewind
    end
  end

  context 'invalid commands' do
    let(:input) do
      <<~COMMANDS
        I 2 3
        B 8 9 2
      COMMANDS
    end

    it 'should raise exception' do
      expect { subject.perform }.to raise_error(/Unknown command specified/)
    end
  end

  context 'I command' do
    describe 'with dimensions too large' do
      let(:input) do
        <<~COMMANDS
          I 300 20
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Image size must be between 250 x 250 pixels/)
      end
    end

    describe 'with negative dimensions' do
      let(:input) do
        <<~COMMANDS
          I 30 -20
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Image size must be between 250 x 250 pixels/)
      end
    end

    describe 'with too many arguments' do
      let(:input) do
        <<~COMMANDS
          I 30 30 20
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too many arguments provided for command/)
      end
    end

    describe 'with too few arguments' do
      let(:input) do
        <<~COMMANDS
          I 30
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too few arguments provided for command/)
      end
    end

    describe 'with invalid argument value' do
      let(:input) do
        <<~COMMANDS
          I 30 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Image size must be between 250 x 250 pixels/)
      end
    end
  end

  context 'C command' do
    describe 'with arguments provided' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          C 20
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too many arguments provided for command/)
      end
    end
  end

  context 'L command' do
    describe 'with pixel off canvas' do
      let(:input) do
        <<~COMMANDS
          I 20 20
          L 30 40 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/You can't draw outside of bitmap/)
      end
    end

    describe 'with negative pixel instruction' do
      let(:input) do
        <<~COMMANDS
          I 20 20
          L -10 10 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/You can't draw outside of bitmap/)
      end
    end

    describe 'with too many arguments' do
      let(:input) do
        <<~COMMANDS
          I 30 30
          L 10 10 20 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too many arguments provided for command/)
      end
    end

    describe 'with too few arguments' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          L 20 10
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too few arguments provided for command/)
      end
    end

    describe 'with invalid colour' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          L 20 10 *
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Invalid colour value specified/)
      end
    end

    describe 'with invalid argument value' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          L 20 B A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/You can't draw outside of bitmap/)
      end
    end
  end

  context 'V command' do
    describe 'with pixel off canvas' do
      let(:input) do
        <<~COMMANDS
          I 20 20
          V 21 1 5 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/You can't draw outside of bitmap/)
      end
    end

    describe 'with negative pixel instruction' do
      let(:input) do
        <<~COMMANDS
          I 20 20
          V -10 5 10 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/You can't draw outside of bitmap/)
      end
    end

    describe 'with too many arguments' do
      let(:input) do
        <<~COMMANDS
          I 30 30
          V 10 10 20 30 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too many arguments provided for command/)
      end
    end

    describe 'with too few arguments' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          V 20 10 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too few arguments provided for command/)
      end
    end

    describe 'with invalid colour' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          V 20 10 15 *
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Invalid colour value specified/)
      end
    end

    describe 'with invalid argument value' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          V 20 B 10 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/You can't draw outside of bitmap/)
      end
    end
  end

  context 'H command' do
    describe 'with pixel off canvas' do
      let(:input) do
        <<~COMMANDS
          I 20 20
          H 1 21 5 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/You can't draw outside of bitmap/)
      end
    end

    describe 'with negative pixel instruction' do
      let(:input) do
        <<~COMMANDS
          I 20 20
          H -10 5 10 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/You can't draw outside of bitmap/)
      end
    end

    describe 'with too many arguments' do
      let(:input) do
        <<~COMMANDS
          I 30 30
          H 10 10 20 30 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too many arguments provided for command/)
      end
    end

    describe 'with too few arguments' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          H 20 10 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too few arguments provided for command/)
      end
    end

    describe 'with invalid colour' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          H 5 10 15 *
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Invalid colour value specified/)
      end
    end

    describe 'with invalid argument value' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          H B 20 10 A
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/You can't draw outside of bitmap/)
      end
    end
  end

  context 'S command' do
    describe 'with arguments provided' do
      let(:input) do
        <<~COMMANDS
          I 30 20
          S 10
        COMMANDS
      end

      it 'should raise exception' do
        expect { subject.perform }.to raise_error(/Too many arguments provided for command/)
      end
    end
  end
end
