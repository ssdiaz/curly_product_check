#Responsibility: Product Class
# Has many products. But one category (?) 

class CurlyProductCheck::Product
    @@all = [] #only has brand names; needed for scrapping check; ex: for 5: ["SoCozy", "Fairy Tales", "Babo Botanicals", "Wet Brush", "Invisibobble"]
        
    attr_accessor :name, :category, :brand, :products, :ingredients, :url, :description

    def initialize(description, brand, url)
        @description = description
        @brand = brand
        @url = url
        add_to_brand #notify category(month) of brand(event)
        save #save/add Brand instance
    end

    def self.all
        @@all
    end

     def save
        @@all << name unless @@all.include?(name)                #@@all << self unless @@all.include?(self)
     end

     def add_to_brand #instance - calling on one intance
        @brand.products << self unless @brand.products.include?(name)
     end

end