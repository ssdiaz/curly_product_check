#Responsibility: Brand Class
# Has many products. But one category (?) 

class CurlyProductCheck::Brand
    @@all = [] #only has brand names; needed for scrapping check; ex: for 5: ["SoCozy", "Fairy Tales", "Babo Botanicals", "Wet Brush", "Invisibobble"]
        
    attr_accessor :name, :category, :products, :url #, :ingredients

    def initialize(name, category, url)
        @name = name
        @category = category
        @url = url
        @products = []
        add_to_category #notify category(month) of brand(event)
        save #save/add Brand instance
    end

    def self.all
        @@all
    end

    def save
        @@all << self unless @@all.include?(self)                #@@all << self unless @@all.include?(self)
    end

    def add_to_category #instance - calling on one intance
        @category.brands << self unless @category.brands.include?(name)
    end

    def get_products
        CurlyProductCheck::Scraper.scrape_products(self) if @products.empty?
    end

end