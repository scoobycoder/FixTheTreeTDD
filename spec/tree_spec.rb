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

  it 'tree should have initial height' do
    expect(@tree.height).to eq(10)
  end

  it 'should require that all trees allow picking of apples' do
    @tree.add_apples
    @tree.pick_an_apple!
    expect(@tree.apples).to eq(1)
  end

  it 'should tell you if it has apples' do
    @tree.add_apples
    expect(@tree.any_apples?).to eq(true)
  end

  it 'should tell you if it has no apples' do
    expect(Tree.new(0).any_apples?).to eq(false)
  end

  it 'should throw an exception if someone tries to pick apples that do not exist' do
    @tree.pick_an_apple!
    expect{@tree.pick_an_apple!}.to raise_error(NoApplesError, 'This tree has no apples')
  end

  it 'should start with at least one apple' do
    expect(@tree.apples).to eq(1)
  end

end

describe 'Fruit' do
end

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

private

def age_my_tree(years)
  years.times do
    @tree.age!
  end
end