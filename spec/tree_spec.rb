require 'rspec'
require './lib/tree'

describe 'Tree' do

  before do
    @tree = Tree.new(1)
  end

  it 'should be a Class' do
    expect(Tree.is_a? Class).to eq(true)
  end

  it 'tree should default to age of zero' do
    expect(@tree.age).to eq(0)
  end

  it 'should age the tree when age! is called' do
    @tree.age!
    expect(@tree.age).to eq(1)
  end

  it 'should die after 200 years old' do
    age_my_tree(201)
    expect(@tree.dead?).to eq(true)
  end

  it 'should should be alive after 199 years old' do
    age_my_tree(200)
    expect(@tree.dead?).to eq(false)
  end

end

describe 'Fruit' do
end

describe 'Apple' do
  before do
    @apple_tree = AppleTree.new(1)
  end

  it 'should tell you if it has apples' do
    @apple_tree.add_apples
    expect(@apple_tree.any_apples?).to eq(true)
  end

  it 'should tell you if it has no apples' do
    expect(Tree.new(0).any_apples?).to eq(false)
  end

  it 'should picking an apple should reduce the number of apples on the tree' do
    @apple_tree.add_apples
    @apple_tree.pick_an_apple!
    expect(@apple_tree.apples).to eq(1)
  end

  it 'should throw an exception if someone tries to pick apples that do not exist' do
    @apple_tree.pick_an_apple!
    expect{@apple_tree.pick_an_apple!}.to raise_error(NoApplesError, 'This tree has no apples')
  end

  it 'should start with at least one apple' do
    expect(@apple_tree.apples).to eq(1)
  end

end

private

def age_my_tree(years)
  years.times do
    @tree.age!
  end
end