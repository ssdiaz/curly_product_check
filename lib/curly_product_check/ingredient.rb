class CurlyProductCheck::Ingredient
    GOOD_ALCOHOLS = ["Cetyl Alcohol", "Cetearyl Alcohol", "Stearyl Alcohol", "Lauryl Alcohol"]
    BAD_ALCOHOLS = ["Ethanol Alcohol", "Ethyl Alcohol", "Propanol Alcohol", "Alcohol denat", "Isopropyl Alcohol", "Isopropanol Alcohol", "Benzyl Alcohol"] 
    # source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols

    @@all_good_ingredients = []
    @@all_bad_ingredients = []

    attr_accessor :name, :product

    def initialize(name, product)
        @name = name
        @product = product
        add_to_product 
    end

    def add_to_product 
        if GOOD_ALCOHOLS.include?(name)    
            @@all_good_ingredients << self
            @product.ingredients << self unless @product.ingredients.include?(name)
        end

        if BAD_ALCOHOLS.include?(name) 
            @@all_bad_ingredients << self
            @product.ingredients << self unless @product.ingredients.include?(name)
        end
    end

    def self.ingredients_for_product(product, array)
        array.select do |ingredient|
            ingredient.product == product
        end
    end

    def self.all_good_ingredients 
        @@all_good_ingredients 
    end

    def self.all_bad_ingredients 
        @@all_bad_ingredients 
    end

    def self.view_good_alcohols
        GOOD_ALCOHOLS
    end

    def self.view_bad_alcohols
        BAD_ALCOHOLS
    end

end