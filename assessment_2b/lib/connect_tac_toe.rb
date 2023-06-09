require_relative 'board'
require_relative 'player'

class ConnectTacToe

    attr_accessor :player_1, :player_2

    def initialize(stacks, max_height)
        @board = Board.new(stacks, max_height)
        @player_1 = Player.new('y')
        @player_2 = Player.new('b')
        @current_player = @player_1
    end 

    def switch_players!
        if @current_player == player_1 
            @current_player = player_2
        else
            @current_player = player_1
        end 
    end 

    def play_turn
        token = @current_player.token
        index = @current_player.get_stack_index
        @board.add(token, index)
        self.switch_players!
    end 

    def play
        until @board.winner?(@player_1.token) || @board.winner?(@player_2.token)
            @board.print
            self.play_turn
            p "--------------------"
        end

        self.switch_players!
        @board.print
        p @current_player.token + " has won!"
    end
end
