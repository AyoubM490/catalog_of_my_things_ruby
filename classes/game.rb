require 'date'

class Game
  def initialize(multiplayer, date)
    @multiplayer = multiplayer
    @last_played_at = date
  end

  def can_be_archived?
    last_played_at = Date.today.year - @last_played_at.year
    return true if last_played_at > 2

    false
  end
end
