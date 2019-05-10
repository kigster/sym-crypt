# coding: utf-8
# frozen_string_literal: true
#
# © 2018 Konstantin Gredeskoul (twitter.com/kig)
# https://github.com/kigster
#
#—————————————————————————————————————————————————————————————————————————————require 'rspec'
require 'spec_helper'

RSpec.describe Sym::Crypt::Configuration do
  subject(:config) { described_class.config }

  context 'accessors' do
    its(:password_cipher)     { should eq 'AES-128-CBC' }
    its(:data_cipher)         { should eq 'AES-256-CBC' }
    its(:private_key_cipher)  { should eq 'AES-256-CBC' }
    its(:compression_enabled) { should eq true }
    its(:compression_level)   { should eq Zlib::BEST_COMPRESSION }
  end
end
