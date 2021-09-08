#Responsibility: Ingredients Class

class CurlyProductCheck::Ingredient
    
    @@GOOD_ALCOHOL = ["Cetyl Alcohol", "Cetearyl Alcohol", "Stearyl Alcohol", "Lauryl Alcohol"]
    #fatty alcohols, long-chain alcohols
    # add moisture by drawing water to the hair, add slip for detangling, add thickness to a product
    #source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols

    BAD_ALCOHOL = ["Ethanol alcohol", "Ethyl Alcohol", "Propanol Alcohol",
        "Alcohol denat", "Isopropyl Alcohol", "Isopropanol Alcohol", "Benzyl Alcohol"] 
    # short-chained alcohols  
    #source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols
    # "These small-chain alcohols are small enough to penetrate the hair shaft and are often the culprit for frizz."
    
    @@all = [] 
        
    attr_accessor :name, :product

    def initialize(name, product)
        @name = name
        @product = product
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