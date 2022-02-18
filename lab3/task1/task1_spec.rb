require 'rspec'
require './task1.rb'

RSpec.describe "task1" do
  before {File.write(NAMES, "Andrey Khlopchik\nMaksim Ivanov\nDmitry Kuznetsov\nDanil Galichin\nSeit-Akaev Igrem")}
  
  it "#index"do
    expect{index}.to output("Andrey Khlopchik\nMaksim Ivanov\nDmitry Kuznetsov\nDanil Galichin\nSeit-Akaev Igrem\n").to_stdout
  end

  it "#where" do
    expect(where("Igrem")).to eq(4)
  end

  it "#update" do
    update(2, "Gromikovskiy Andrey")
    expect{index}.to output("Andrey Khlopchik\nMaksim Ivanov\nGromikovskiy Andrey\nDanil Galichin\nSeit-Akaev Igrem\n").to_stdout
  end

  it "#delete" do
    delete(1)
    expect{index}.to output("Andrey Khlopchik\nGromikovskiy Andrey\nDanil Galichin\nSeit-Akaev Igrem\n").to_stdout
  end

  it "#find" do
    expect{find(3)}.to output("Danil Galichin\n").to_stdout
  end
end
