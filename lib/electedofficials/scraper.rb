class Electedofficials::Scraper

def self.scrape_cm
    page = Nokogiri::HTML(open("https://council.nyc.gov/districts/"))
      page.css(".sort-member").each do |member|
        name = member.css("a").text.strip
        # office = "Council Member"
        # party = member.css(".sort-party").text.strip
        # borough = member.css(".sort-borough").text
        # url = member.css("a").attr("href").text
        Electedofficials::Official.new(name) #office, party, borough, url)

      end
end

end
