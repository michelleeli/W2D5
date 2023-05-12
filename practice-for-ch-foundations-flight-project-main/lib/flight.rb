require "passenger"

class Flight
    attr_accessor :passengers , :capacity, :flight_number
    
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []

    end 

    def passengers 
        @passengers
    end 

    def full?
        if passengers.length < capacity 
            false
        else
            true
        end 
    end 

    def board_passenger(passenger)
        if !self.full? && passenger.has_flight?(flight_number)
            @passengers << passenger
        end 
    end 

    def list_passengers
        names = []
        @passengers.each do |passenger|
            names << passenger.name
        end 
        names
    end 

    def [](index)
        @passengers[index]
    end 

    def <<(passenger)
        board_passenger(passenger)
    end 

end 