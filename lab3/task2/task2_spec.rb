require 'rspec'
require './task2.rb'

RSpec.describe "task2" do
  before(:each) do
    File.write(OUTPUT, "")
  end

  it "#witout negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(21, 99)
    expect{read_students}.to output("Введите возраст студента\nВведите возраст студента\nEvgeniy Baranov 21\nVladimir Putin 99\n").to_stdout
  end


  it "#with negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(21, 99, -1)
    expect{read_students}.to output("Введите возраст студента\nВведите возраст студента\nВведите возраст студента\nВы ввели -1 (ВЫХОД)\nEvgeniy Baranov 21\nVladimir Putin 99\n").to_stdout
  end

  it "#straightaway negative number" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(-1)
    expect{read_students}.to output("Введите возраст студента\nВы ввели -1 (ВЫХОД)\n").to_stdout
  end
end
