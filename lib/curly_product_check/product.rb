#Responsibility: Product Class

class CurlyProductCheck::Product
    @@all = [] #only has brand names; needed for scrapping check; ex: for 5: ["SoCozy", "Fairy Tales", "Babo Botanicals", "Wet Brush", "Invisibobble"]
        
    attr_accessor :name, :category, :brand, :products, :ingredients, :url#, :description

    def initialize(name, brand, url)
        @name = name
        @brand = brand
        @url = url
        @ingredients = []
        add_to_brand #notify category(month) of brand(event)
        save 
    end

    def self.all
        @@all
    end

     def save
        @@all << self unless @@all.include?(self)  #@@all << name unless @@all.include?(name)                    
     end

     def add_to_brand #instance - calling on one intance
        @brand.products << self unless @brand.products.include?(name)
     end

     def get_ingredients
        CurlyProductCheck::Scraper.scrape_ingredients(self) if @ingredients.empty?
    end


end