#Responsibility: Ingredients Class

class CurlyProductCheck::Ingredient
    
    GOOD_ALCOHOL = ["Cetyl alcohol", "Cetearyl alcohol", "Stearyl alcohol", "Lauryl alcohol"]
    #fatty alcohols, long-chain alcohols
    # add moisture by drawing water to the hair, add slip for detangling, add thickness to a product
    #source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols

    BAD_ALCOHOL = ["Ethanol alcohol", "Ethyl alcohol", "Propanol alcohol", "Alcohol denat", "Isopropyl alcohol", "Isopropanol alcohol", "Benzyl alcohol"] 
    # short-chained alcohols  
    #source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols
    # "These small-chain alcohols are small enough to penetrate the hair shaft and are often the culprit for frizz."
    
    @@all = [] #only has brand names; needed for scrapping check; ex: for 5: ["SoCozy", "Fairy Tales", "Babo Botanicals", "Wet Brush", "Invisibobble"]
        
    attr_accessor :name, :product, :url 

    def initialize(name, product, url)
        @name = name
        @product = product
        @url = url
        add_to_product 
        save 
    end

    def self.all
        @@all
    end

    def save
        @@all << self unless @@all.include?(self)                #@@all << self unless @@all.include?(self)
    end

    def add_to_product 
        @product.ingredients << self unless @product.ingredients.include?(name)
    end

end