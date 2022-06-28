require_relative '../classes/game'

describe Game do
  before :each do
    @game = Game.new(true, 2021, 2002, false)
    @game2 = Game.new(true, 2019, 2002, false)
  end

  it 'creates a new instance of Game' do
    expect(@game).to be_a(Game)
  end

  it 'returns properties with getter' do
    expect(@game.multiplayer).to eq true
    expect(@game.last_played_at).to eq 2021
  end

  it 'can_be_archived? returns false if @last_played_at is < 2' do
    expect(@game.can_be_archived?).to eq false
  end

  it 'can_be_archived? returns true if @last_played_at is > 2' do
    expect(@game2.can_be_archived?).to eq true
  end
end
