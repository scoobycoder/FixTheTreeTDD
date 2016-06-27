require 'rspec'
require './lib/tree'

describe 'Apple' do
  before do
    @apple = Apple.new('green', 4)
  end

  it 'should have a diameter' do
    expect(@apple.diameter).to eq(4)
  end

  it 'should have a color' do
    expect(@apple.color).to eq('green')
  end

end