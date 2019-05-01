require 'sym/crypt'

TEST_KEY = 'LxRV7pqW5XY5DDcuh128byukvsr3JLGX54v6eKNl8a0='
class TestClass
  include Sym::Crypt
  private_key TEST_KEY # Use ENV['SECRET'] in prod
end

RSpec.shared_context :test_instance do
  let(:instance) { TestClass.new }
  let(:test_class) { TestClass }
  let(:key) { TestClass.create_private_key }
end

RSpec.shared_context :abc_classes do
  let(:c_private_key) { 'BOT+8SVzRKQSl5qecjB4tUW1ENakJQw8wojugYQnEHc=' }
  before do
    class AClass
      include Sym::Crypt
    end
    class BClass
      include Sym::Crypt
    end
    class CClass
      include Sym::Crypt
      private_key 'BOT+8SVzRKQSl5qecjB4tUW1ENakJQw8wojugYQnEHc='
    end
  end
end
