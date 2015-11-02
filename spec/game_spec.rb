require 'game'

describe Game do

  subject(:game) {described_class.new('rock')}
  # let(:computer) {double(:computer)}
  context 'the player lost' do
    it 'if has a rock & the computer has scissor' do
    #  allow(computer).to receive(:hand).and_return(:scissor)
    srand(437)
      expect(game.play).to eq :win
    end
  end
end
