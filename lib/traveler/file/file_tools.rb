module Traveler
  module FileTools
    # Parses the given url
    # [params]
    # * url => path of the file
    # [returns]
    # * Array of Cities
    def self.parse url
      ary = []
      begin
        File.read(url).each_line.each do |line|
          city = line.split("\t").reject(&:empty?)
          ary << City.new(name: city[0],
                          x: city[1],
                          y: city[2]
                        )
        end
        ary
      rescue => e
        puts "Error parsing the File #{url} #{e}"
      end
    end
  end
end
