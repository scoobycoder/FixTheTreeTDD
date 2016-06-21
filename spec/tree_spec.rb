require 'rspec'
require './lib/tree'

describe 'Tree' do

  before do
    @tree = Tree.new
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
    age_my_tree(199)
    expect(@tree.dead?).to eq(false)
  end

end

describe 'Fruit' do
end

describe 'Apple' do
  before do
    @apple_tree = AppleTree.new
  end

  it 'should tell you if it has apples' do
    @apple_tree.add_apples
    expect(@apple_tree.any_apples?).to eq(true)
  end

  it 'should tell you if it has no apples' do
    expect(@apple_tree.any_apples?).to eq(false)
  end
end

private

def age_my_tree(years)
  years.times do
    @tree.age!
  end
end