require 'rspec'
require_relative 'CashMachine'

RSpec.describe CashMachine do
    before(:each) {File.write('balance.txt', '100.0', mode:'w')}

    it '#start balance' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('b', 'q')
      expect (subject.init)
      expect{ subject.balance }.to output("Ваш баланс 100.0\n").to_stdout
    end

    it '#deposit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('d', 100, 'q')
      expect (subject.init)
      expect(File.read('balance.txt')).to eql('200.0')
    end

    it '#withdraw' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return('w', 50, 'q')
      expect (subject.init)
      expect(File.read('balance.txt')).to eql('50.0')
    end
  end
