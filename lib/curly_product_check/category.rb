class CurlyProductCheck::Category
    @@all = [] 
        
    attr_accessor :name, :url, :brands

    def initialize(name, url)
        @name = name
        @url = url
        @brands = []
        save
    end

    def self.all
        @@all
    end

    def save
       @@all << self unless @@all.include?(self)  
    end

    def scrape_brands
        CurlyProductCheck::Scraper.scrape_brands(self) if @brands.empty?
    end

end