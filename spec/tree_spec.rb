require 'rspec'
require './lib/tree'

describe 'Tree' do
  it 'should be a Class' do
    expect(Tree.is_a? Class).to eq(true)
  end

  it 'should tell you if it has apples' do
    apple_tree = AppleTree.new
    apple_tree.add_apples
    expect(apple_tree.any_apples?).to eq(true)
  end

  it 'should tell you if it has no apples' do
    apple_tree = AppleTree.new
    expect(apple_tree.any_apples?).to eq(false)
  end

end

describe 'Fruit' do
end

describe 'Apple' do
end
