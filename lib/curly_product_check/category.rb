class CurlyProductCheck::Category
    @@all = [] 
        
    attr_accessor :name, :brand
   # attr_writer :brand

    def initialize(name)
        @name = name
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