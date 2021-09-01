#Responsibility: Scrape the data needed.

class CurlyProductCheck::Scraper
    VALID_CATEGORIES = ["Shampoo & Conditioner", "Treatment", "Styling Products", "Hair Color",  "Kid's Haircare", "Travel Size"]
    #HIDE_TOOLS_CATEGORIES = ["Hair Styling Tools", "Hair Brushes & Combs", "Accessories", "Gifts & Value Sets"]

    @@site_categories = "https://www.ulta.com/hair?N=26wz"
    @@site = "https://www.ulta.com/hair-shampoo-conditioner?N=27ih"
    
    def self.scrape_categories 
        #only needs to scrape this once. not per instance.
        #listed as class method (self.methodname)
        doc = Nokogiri::HTML(open(@@site_categories))

        category = doc.css("li.cat-sub-nav a")
        category.each do |i|
            name = i.text.strip
            CurlyProductCheck::Category.new(name) if VALID_CATEGORIES.include?(name)
        end
    end

end