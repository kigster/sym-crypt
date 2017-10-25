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
      context 'Singleton ancestor' do
        its(:ancestors) { should include(Singleton) }
      end
      context 'Sym::Configurable ancestor' do
        its(:ancestors) { should include(Sym::Configurable) }
      end
    end

    describe '#configure' do
      subject(:moofie) { moofie_class.config }

      it 'should properly call the setter' do
        expect(moofie).to receive(:tail=).with(:bushy)
        moofie_class.configure { |m| m.tail = :bushy }
      end

      describe '#property' do
        it 'can be used to access attribute' do
          prev = moofie.tail
          moofie_class.configure { |m| m.tail = :bushy }
          expect(moofie_class.property(:tail)).to eq(:bushy)
          moofie_class.configure { |m| m.tail = prev }
        end
      end
    end

    describe 'subclassing' do
      subject(:popo) { Sym::Popo.config }

      it 'should not be the same as the superclass' do
        expect(Sym::Popo.config).not_to eq(Sym::Moofie.config)
        expect(Sym::Popo.config).to respond_to(:tail)
        expect(Sym::Popo.config).to respond_to(:meow)
        expect(Sym::Moofie.config).to respond_to(:tail)
        expect(Sym::Moofie.config).not_to respond_to(:meow)
      end

      describe 'initially' do
        its(:class) { should eq(Sym::Popo) }
        its(:meow) { should be_nil }
      end

      describe '#attr_accessor' do
        before { Sym::Popo.configure { |p| p.meow = :whiny } }
        its(:meow) { should eq :whiny }
        after { Sym::Popo.configure { |p| p.meow = nil } }
      end

    end
  end
end


