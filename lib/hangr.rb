require "hangr/version"
require "hangr/init_db"

require "hangr/player"
require "hangr/game"

require "pry"

module Hangr
  binding.pry

  # Your code goes here...
  class App
    def initialize
      @player = nil
      @game = nil
    end

    def greeting
      puts "Welcome to Database Hangman!"
      puts "What is your name, stranger?"
      name = gets.chomp

      existing_player = Player.find_by(name: name)
      if existing_player
        @player = existing_player
        puts "Welcome back, #{name}!"
      else
        @player = Player.create(name: name, total_wins: 0)
        puts "Good luck, sucker!"
      end
    end

    def choose_game
    end

    def resume_game
      games = Game.where(player_id: @player.id, finished: false)
      puts "Which game would you like to play?"
      games.each do |game|
        puts "ID: #{game.id} | Turn count: #{game.turn_count}"
      end
      game_id = gets.chomp.to_i


      # Remember that map runs something on every element in an array.
      # The ampersand syntax is just shorthand for calling a method with no args.
      # map(&:id)
      # map { |x| x.id }

      until games.map(&:id).include?(game_id)
        puts "You have to pick from the list, dummy."
        game_id = gets.chomp.to_i
      end


      until Game.exists?(player_id: @player.id, finished: false, id: game_id)
        puts "You have to pick from the list of *your* games!"
        game_id = gets.chomp.to_i
      end

      @game = Game.find(game_id)
    end

    def run
      greeting
      choose_game
      until @game.finished?
        take_turn
      end
      play_again?
    end
  end
end

app = Hangr::App.new
app.run
