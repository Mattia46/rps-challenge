
class Computer

  attr_reader :hand

  HAND = [:rock,:paper, :scissor]
  
  def initialize
    @hand = HAND.sample
  end

end
