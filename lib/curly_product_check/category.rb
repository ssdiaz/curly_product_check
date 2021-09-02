#Responsibility: Category Class
# Has many Brands.

class CurlyProductCheck::Category
    @@all = [] 
        
    attr_accessor :name, :brand, :url
    # attr_writer :brand

    def initialize(name, url)
        @name = name
        @url = url
        @brand = []
        save
    end

    def self.all
        CurlyProductCheck::Scraper.scrape_categories if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end

    # def brand
    #     CurlyProductCheck::Scraper.scrape_brands(self) if @brand.empty?
    #     @brand
    # end

    def get_brand
        CurlyProductCheck::Scraper.scrape_brands(self) if @brand.empty?
        @brand
    end

end