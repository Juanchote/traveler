module Traveler
  # Class City
  # class for storing cities with their coordinates.
  class City
    attr_accessor :name, :x, :y

    # Constructor
    # [params]
    # * values => hash of values
    def initialize values={}
      @name = values[:name]
      @x = values[:x].to_f
      @y = values[:y].to_f
    end

    # Finds the nearest city from self
    def nearest_city
      Traveler.cities.min_by { |city| self.distance_to city }
    end

    # Calculates the distance between to cities
    # [params]
    # * other_city => The city to calculate the distance
    def distance_to other_city
      Math.sqrt((other_city.x - @x)**2 + (other_city.y - @y)**2)
    end
  end
end
