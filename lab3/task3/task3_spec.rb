require 'rspec'
require './task3.rb'

RSpec.describe "task3" do
    before(:each) {File.write(BALANCE, "100.0", mode:"w")}

    it '#deposit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n", 100, "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\nВведите значение депозита нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\n").to_stdout
    end

    it '#deposit with mistake' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n", -100, 100, "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\nВведите значение депозита Значение должно быть > 0\nнажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\n").to_stdout
    end

    it '#balance' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("b\n", "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\nВаш баланс 100.0\nнажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\n").to_stdout
    end

    it '#quit' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\n").to_stdout
    end

    it '#withdraw' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n", 50, "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\nВведите значение для вывода нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\n").to_stdout
    end

    it '#withdraw with mistake' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n", -150, 50, "q\n")
      expect{start}.to output("Ваш баланс 100.0 нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\nВведите значение для вывода Значение долно быть > 0 и < значения баланса\nнажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)\n").to_stdout
    end
  end
