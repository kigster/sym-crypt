require 'sym/crypt'

RSpec.describe 'Object' do
  context '#present?' do
    it 'should properly respond to present' do
      expect(Object.new.present?).to be true
      expect(1.present?).to be true
      expect(String.new.present?).to be false
      expect(''.present?).to be false
      expect('hello'.present?).to be true
      expect(nil.present?).to be false
    end
  end
end
