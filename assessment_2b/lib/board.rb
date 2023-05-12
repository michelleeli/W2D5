class Board
    attr_accessor :max_height 

    def self.build_stacks(num_stacks)
        arr = Array.new(num_stacks) {Array.new()} 
        arr
    end 

    def print
        @stacks.each { |stack| p stack }
    end

    def initialize(stacks, max_height)
        if stacks > 4 || max_height > 4 
            @max_height = max_height
            @stacks = Board.build_stacks(stacks)
        else
            raise "rows and cols must be >=4"
        end 
    end 

    def add(token, stack_index)
        if @stacks[stack_index].length < max_height
            @stacks[stack_index] << token
            return true
        else
            return false
        end 
    end 

    def vertical_winner?(token)
        @stacks.each do |stack|
            if stack.length == max_height && stack.all?(token)
                return true
            end 
        end 
        false
    end 

    def horizontal_winner?(token)
        (0...max_height).each do |i|
            level = []
            @stacks.each do |stack|
                if stack[i] == token 
                    level << token
                end 
                if level.length == @stacks.length
                    return true        
                end 
            end 
        end 
        false
    end 

    def winner?(token)
        if horizontal_winner?(token) || vertical_winner?(token)
            return true
        else
            false
        end 
    end 

end
