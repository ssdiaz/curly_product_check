#Responsibility: Scrape the data needed.

class CurlyProductCheck::Scraper
    VALID_CATEGORIES = ["Shampoo & Conditioner", "Treatment", "Styling Products", "Hair Color",  "Kid's Haircare", "Travel Size"]
    
    @@site = "https://www.ulta.com/hair?N=26wz"

    def self.scrape_categories 
        #only needs to scrape this once. not per instance, so listed as class method (self.methodname)
        doc = Nokogiri::HTML(open(@@site))

        category = doc.css("li.cat-sub-nav a")
        category.each do |i|
            #here, setting name, url, and creating category for each cats.
            name = i.text.strip
            url = i.attr("href")
            CurlyProductCheck::Category.new(name, url) if VALID_CATEGORIES.include?(name)
        end
    end

    def self.scrape_brands(category)
        url = "https:#{category.url}"
        doc = Nokogiri::HTML(open(url))
        brand_title = doc.css("h4.prod-title a")

        brand_title.each do |i|
            name = i.text.strip
            CurlyProductCheck::Brand.new(name, category) unless CurlyProductCheck::Brand.all.include?(name)
        end

        # CurlyProductCheck::Brand.new("name - brandA", category) #test brand data 
        # CurlyProductCheck::Brand.new("name - brandB", category) #test brand data 
    end

end