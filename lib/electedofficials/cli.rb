class Electedofficials::CLI

  def call
    Electedofficials::Scraper.scrape_cm
    representatives
    menu
  end

  def representatives
    @offices = ["Office of the Mayor of NYC", "City Council", "Borough Presidents"]
    @offices.each_with_index {|person, index| puts "#{index+1}. #{person}"}
  end

  def city_council
    city_council = Electedofficials::Official.all
    city_council.each.with_index(1) {|person, index| puts "#{index}. #{person.name}"}
  end

  def borough_presidents
    presidents = {:Bronx => "Ruben Diaz Jr", :Brooklyn => "Eric Adams", :Manhattan => "Gale Brewer", :Queens => "Melinda Katz", :Staten_Island => "James Oddo"}
    presidents.each do |borough, president|
      puts "#{borough}: #{president}".gsub(/_/, " ")
    end
  end

  def menu
    puts "Enter the number corresponding to the Office you would like to learn more about, or 'exit' to exit."
    input = nil
      while input != "exit"
        input = gets.strip
        case input
        when "1"
          puts "The Mayor of New York City is: Bill de Blasio"
          options
        when "2"
          puts "The New York City Council Members are:"
          city_council
          options
        when "3"
          puts "The New York City Borough Presidents are:"
          borough_presidents
          options
        when "list"
          representatives
          options
        when "exit"
          goodbye
        else
          puts "Invalid Input"
          options
        end
      end
  end

  def goodbye
    puts "Goodbye!"
  end

  def options
      puts "Enter 'list' for list of Offices or 'exit' to exit"
  end
end
