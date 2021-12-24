require 'rspec'
require_relative '../script'

describe '#script' do
  it 'should be ok for a word ending with CS' do
    expect(search_letters('khlopchikCS')).to eq(2048)
  end

  it 'should be ok for words not ending in CS' do
    expect(search_letters('khlopchik')).to eq('kihcpolhk')
  end
end
