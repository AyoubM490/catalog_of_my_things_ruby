class Game
  def initialize(multiplayer, date)
    @multiplayer = multiplayer
    @last_played_at = date
  end

  def can_be_archived?; end
end
