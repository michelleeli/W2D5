class Item

    attr_accessor :title, :deadline, :description

    def self.valid_date?(date)
        parts = date.split("-")

        if parts.length != 3
            return false
        end 
        if parts[0].length != 4 || parts[1].length != 2 || parts[2].length != 2 
            return false
        end 
        if parts[1].to_i < 1 || parts[1].to_i > 12 || parts[2].to_i < 1 || parts[2].to_i > 31
            return false
        end 
        true 
    end 

    def initialize(title, deadline, description)
        if !Item.valid_date?(deadline)
            raise "invalid date"
        else
            @title = title
            @deadline = deadline
            @description = description
        end 
    end 

    def title=(newtitle)
        @title = newtitle
    end 
    
    def deadline=(newdeadline)
        if Item.valid_date?(newdeadline)
            @deadline = newdeadline
        else
            raise "invalid date"
        end
    end 

    def description= (newdescription)
        @description = newdescription
    end 

end