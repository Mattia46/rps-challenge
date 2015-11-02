require_relative 'player'

class Game2Player

  attr_reader :player1, :player2

  RULES = {
    rock:    :paper,
    paper:   :scissor,
    scissor: :rock,
    # scissor: :spock,
    }

  def initialize(hand1, hand2)
    @player1 = Player.new(hand1)
    @player2 = Player.new(hand2)
  end

  def play
    return :draw if @player1.hand == @player2.hand
    return :win if rules(@player2.hand) == @player1.hand
    return :lose if rules(@player1.hand) == @player2.hand
  end


  private
  def rules(hand)
    RULES[hand]
  end

end
