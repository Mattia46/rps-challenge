require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/game2p'

class Rps < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/one_player' do
    erb(:one_player)
  end

  get '/first_player' do
    erb(:first_player)
  end

  post '/name' do
    $player = params[:name]
    redirect('/welcome')
  end

  post '/names' do
    $player1 = params[:name1]
    $player2 = params[:name2]
    redirect('/welcomes')
  end

  get '/welcome' do
    @player = $player
    erb(:welcome)
  end

  get '/welcomes' do
    @player1 = $player1
    @player2 = $player2
    erb(:welcomes)
  end

  get '/play_solo' do
    @player = $player
    erb(:play_solo)
  end

  get '/multy_player' do
    @player1 = $player1
    @player2 = $player2
    erb(:multy_player)
  end

  post '/playing' do
    @player = $player
    @hand = params[:hand]
    $game = Game.new(@hand)
    redirect('/score')
  end

  post '/playing_multy1' do
    @player1 = $player1
    $game = Game2Player.new(params[:hand1], params[:hand2])
    redirect('/scores')
  end

  get '/score' do
    @player = $player
    @game = $game
    erb(:score)
  end

  get '/scores' do
    @player1 = $player1
    @player2 = $player2
    @game = $game2p
    erb(:scores)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
