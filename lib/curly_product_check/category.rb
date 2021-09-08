#Responsibility: Category Class
# Has many Brands.

class CurlyProductCheck::Category
    @@all = [] 
        
    attr_accessor :name, :brands, :url

    def initialize(name, url)
        @name = name
        @url = url
        @brands = []
        save
    end

    def self.all
        CurlyProductCheck::Scraper.scrape_categories if @@all.empty?
        @@all
    end

    def save
        @@all << self unless @@all.include?(name)
    end

    def get_brands
        CurlyProductCheck::Scraper.scrape_brands(self) if @brands.empty?
    end

end    
