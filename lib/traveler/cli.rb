require "thor"

class Cli < Thor
  desc "nearest_neighbour", "My first approach"
  def nearest_neighbour
    Traveler.nearest_neighbour
  end

  desc "held_kalp","Second approach with the Held-Kalp algorithm"
  def held_kalp
    Traveler.held_kalp
  end
end

