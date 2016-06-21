require 'rspec'
require './lib/tree'

describe 'Tree' do
  it 'should be a Class' do
    expect(Tree.is_a? Class).to eq(true)
  end
end

describe 'Fruit' do
end

describe 'Apple' do
end
