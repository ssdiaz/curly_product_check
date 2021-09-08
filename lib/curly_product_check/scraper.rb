#Responsibility: Scrape the data needed.

class CurlyProductCheck::Scraper

    def self.scrape_categories 
        #only needs to scrape this once. not per instance, so listed as class method (self.methodname)
        
        site = "https://www.ulta.com/hair?N=26wz"
        valid_categories = ["Shampoo & Conditioner", "Treatment", "Styling Products", "Hair Color",  "Kid's Haircare", "Travel Size"]

        doc = Nokogiri::HTML(open(site))

        category = doc.css("li.cat-sub-nav a")
        category.each do |i|
            name = i.text.strip
            url = i.attr("href")
            CurlyProductCheck::Category.new(name, url) if valid_categories.include?(name)
        end
    end

    def self.scrape_brands(category)
        url = "https:#{category.url}"
        doc = Nokogiri::HTML(open(url))
        brand = doc.css("h4.prod-title a")

        brands_scraped= []
        brand.each do |i|
            name = i.text.strip
            url_brand = i.attr("href")
            CurlyProductCheck::Brand.new(name, category, url_brand) unless brands_scraped.include?(name)              # CurlyProductCheck::Brand.new(name, category) unless CurlyProductCheck::Brand.all.include?(name)
            brands_scraped << name
        end
    end


    def self.scrape_products(brand)
        url = "https://www.ulta.com#{brand.url}"
        doc = Nokogiri::HTML(open(url))
        product = doc.css("h4.prod-title a")

        products_scraped= []
        product.each do |i|
            name = i.text.strip
            url_product = i.attr("href")
            CurlyProductCheck::Product.new(name, brand, url_product) unless products_scraped.include?(name)              # CurlyProductCheck::Brand.new(name, category) unless CurlyProductCheck::Brand.all.include?(name)
            products_scraped << name
        end

        # CurlyProductCheck::Product.new("name - prodA", brand, "url1") #test brand data 
        # CurlyProductCheck::Product.new("name - prodB", brand, "url2") #test brand data 
    end




end