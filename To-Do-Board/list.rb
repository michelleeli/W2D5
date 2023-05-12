require_relative "item"

class List

    attr_reader :label, :items

    def initialize(label)
        @label = label
        @items = []
    end 

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            items << Item.new(title, deadline, description)
            return true
        else
            raise "invalid date"
            return false
        end 
    end 

    def size
        items.length
    end 

    def valid_index?(index)
        if index < 0 || index > (items.length - 1)
            return false
        else
            return true
        end 
    end 

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            items[index_1], items[index_2] = items[index_2] , items[index_1]
            return true
        else
            return false
        end 
    end 

    def [](index)
        if self.valid_index?(index)
            return items[index]
        end 
    end 

    def priority
        items[0]
    end 

    def print
        p "---------------------------------"
        + " ".ljust(10) + label
        p "---------------------------------"
        p "Index".ljust(8) + "|    Item".ljust(15) + "|  Deadline"
        p "---------------------------------"
        items.each_with_index do |item, idx|
            p idx.to_s  + " ".ljust(8) + "|" + "#{item.title}".ljust(13) + "| #{item.deadline} "
        end 
        p "---------------------------------"
    end 

    def print_full_item(index)
        if self.valid_index?(index)
            i = items[index]
            p "------------------------------------------"
            p "#{puts i.title + " ".ljust(20) + i.deadline}"
        end 
    end 

end 