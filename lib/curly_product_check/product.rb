#Responsibility: Product Class

class CurlyProductCheck::Product
    @@all = [] #only has brand names; needed for scrapping check; ex: for 5: ["SoCozy", "Fairy Tales", "Babo Botanicals", "Wet Brush", "Invisibobble"]
        
    attr_accessor :name, :brand, :products, :ingredients, :url

    def initialize(name, brand, url)
        @name = name
        @brand = brand
        @url = url
        @ingredients = []
        add_to_brand 
        save 
    end

    def self.all
        @@all
    end

     def save
        @@all << self unless @@all.include?(self)                  
     end

     def add_to_brand #instance - calling on one intance
        @brand.products << self unless @brand.products.include?(name)
     end

     def get_ingredients
        CurlyProductCheck::Scraper.scrape_ingredients(self) if @ingredients.empty?
    end

    def self.clear
        @@all.clear
    end

end