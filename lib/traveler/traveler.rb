module Traveler
    @cities, @visited_cities = [], []

    # Parses the given file and sets the starting city
    # [params]
    # * name => Name of the starting city
    # * url => Path of the cities file
    # [returns]
    # * @cities => Array of Cities
    def self.init_cities name, url
      @cities = Traveler::FileTools.parse url
      starting_city name
      @cities
    end

    # My first solution to the Traveler Salesman Problem
    # After googling, looks like it is called: Nearest Neighbour
    # [params]
    # * name => Starting city
    def self.nearest_neighbour name='Beijing', url='cities.txt'
      init_cities name, url
      @visited_cities = []
      city = starting_city name
      while (city = @cities.delete(city.nearest_city)) do
        @visited_cities << city
      end
      print_visited_cities
    end

    # Second approach with a more accurate version, tried to gain speed
    # with Threads but the time still huge (i have no clue).
    # [params]
    # * name => Starting city
    # * url => File to load
    def self.held_karp name='Beijing', url='cities.txt'
      start_time = Time.now
      init_cities name, url
      perms = @cities.permutation(@cities.size).each_slice(1000)

      threads, moar_perms = [], []
      perms.first(5000).each do |perm|
        threads << Thread.new(perm) do |perm|
          moar_perms << perm.map do |p|
            [p, travel_to(p)]
          end.min_by { |c| c.last }
        end
      end

      while threads.detect{ |t| t.status == "run" }; end

      @visited_cities.concat(moar_perms.min_by{ |c| c[1] }.first)

      print_visited_cities
      puts "#{Time.now - start_time}"
    end

    # Returns cities
    def self.cities
      @cities
    end

    private

    # Given a travel, calculates the distance
    # [params]
    # * ary => Array of Cities
    def self.travel_to ary
      if ary.size == 1
        @first_city.distance_to(ary.first)
      else
        ary[0].distance_to(ary[1]) + travel_to(ary.drop(1))
      end
    end
      # Selects the starting City, removes it from the @cities var and adds it
      # to the @visited_cities
      # [params]
      # * name => Name of the starting city
      # [returns]
      # * @starting_city => The first City or nil if nothing is found
    def self.starting_city name='Beijing'
      @first_city = @cities.detect { |city| city.name === name }
      @visited_cities <<  @cities.delete(@first_city)
      @first_city ? @first_city : raise
    end

    # Prints the best travel
    def self.print_visited_cities
      @visited_cities.each do |city|
        STDOUT.write("#{city.name}\n")
      end
      nil
    end
end
