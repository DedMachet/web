require 'rspec'
require_relative '../pokemons'

describe '#add_pokemon' do
  it 'should be ok for adding 2 pokemon' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(2, 'Pikachu', 'yellow', 'Flareon', 'orange')
    expect(add_pokemon(pokemons = [])).to eq([{ name: 'Pikachu', color: 'yellow' }, { name: 'Flareon', color: 'orange' }])
  end
end
