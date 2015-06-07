require "thor"
module Traveler
  class Cli < Thor
    desc "nearest_neighbour", "My first approach"
    def nearest_neighbour
      Traveler.nearest_neighbour
    end

    desc "held_karp","Second approach with the Held-Kalp algorithm"
    def held_karp
      Traveler.held_karp
    end
  end
end

