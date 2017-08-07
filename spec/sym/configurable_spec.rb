require 'spec_helper'
require 'sym/configurable'
module Sym
  # Note, Moofie is a cat.
  class Moofie
    attr_accessor :tail
    include Sym::Configurable
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
  end
end


