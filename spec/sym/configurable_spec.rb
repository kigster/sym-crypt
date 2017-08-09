require 'spec_helper'
require 'sym/configurable'
module Sym
  # Note, Moofie is a cat.
  class Moofie
    attr_accessor :tail
    include Sym::Configurable
  end

  class Popo < Moofie
    attr_accessor :meow
  end

  RSpec.describe 'Sym::Configurable' do
    subject(:moofie_class) { Sym::Moofie }
    describe 'is a Singleton and a Sym::Configurable' do
      its(:instance) { should eq moofie_class.config }
      its(:ancestors) { should include(Singleton) }
      its(:ancestors) { should include(Sym::Configurable) }
    end

    describe 'can be configured' do
      subject(:moofie) { moofie_class.config }
      before do
        moofie_class.configure do |m|
          m.tail = :bushy
        end
      end

      its(:tail) { should eq(:bushy) }

      describe '#property' do
        it 'can be used to access attribute' do
          expect(moofie_class.property(:tail)).to eq(:bushy)
        end
      end
    end

    describe 'sub-classes of the main config' do
      subject(:popo) { Sym::Popo.config }

      its(:class) { should eq(Sym::Popo) }
      its(:meow) { should be_nil }

      describe 'subclass accessors' do
        before { Sym::Popo.configure { |p| p.meow = :whiny } }
        its(:meow) { should eq :whiny }
        after { Sym::Popo.configure { |p| p.meow = nil } }
      end

      it 'should not be the same as the superclass' do
        expect(Sym::Popo.config).not_to eq(Sym::Moofie.config)

        expect(Sym::Moofie.config).to respond_to(:tail)
        expect(Sym::Popo.config).to respond_to(:tail)

        expect(Sym::Moofie.config).not_to respond_to(:meow)
        expect(Sym::Popo.config).to respond_to(:meow)
      end
    end
  end
end


