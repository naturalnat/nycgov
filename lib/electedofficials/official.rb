class Electedofficials::Official
  attr_accessor :name, :office, :party, :borough, :url

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end
