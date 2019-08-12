class Electedofficials::Scraper

  def self.scrape_cm
    page = Nokogiri::HTML(open("https://council.nyc.gov/districts/"))
      page.css(".sort-member").each do |member|
        name = member.css("a").text.strip
        Electedofficials::Official.new(name)
      end
  end

end
