#Responsibility: Ingredients Class

class CurlyProductCheck::Ingredient
    @@good_alcohol = ["Cetyl Alcohol", "Cetearyl Alcohol", "Stearyl Alcohol", "Lauryl Alcohol"]
    # fatty alcohols, long-chain alcohols
    # add moisture by drawing water to the hair, add slip for detangling, add thickness to a product
    # source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols

    @@bad_alcohol = ["Ethanol alcohol", "Ethyl Alcohol", "Propanol Alcohol", "Alcohol denat", "Isopropyl Alcohol", "Isopropanol Alcohol", "Benzyl Alcohol"] 
    # short-chained alcohols  
    # source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols
    # "These small-chain alcohols are small enough to penetrate the hair shaft and are often the culprit for frizz."
 
    @@all_good = []
    @@all_bad = []
        
    attr_accessor :name, :product

    def initialize(name, product)
        @name = name
        @product = product
        add_to_product 
    end

    def add_to_product 
        if @@good_alcohol.include?(name) 
            @@all_good << self
            @product.ingredients << self unless @product.ingredients.include?(name)
        end

        if @@bad_alcohol.include?(name) 
            @@all_bad << self
            @product.ingredients << self unless @product.ingredients.include?(name)
        end
    end

    def self.all_good
        @@all_good
    end

    def self.all_bad
        @@all_bad
    end

    def self.view_good_list
        @@good_alcohol
    end

    def self.view_bad_list
        @@bad_alcohol
    end

    def self.clear
        @@all_good.clear
        @@all_bad.clear
    end

end