class CurlyProductCheck::Ingredient
    # source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols

    @@good_alcohol_list = ["Cetyl Alcohol", "Cetearyl Alcohol", "Stearyl Alcohol", "Lauryl Alcohol"]
    @@bad_alcohol_list = ["Ethanol Alcohol", "Ethyl Alcohol", "Propanol Alcohol", "Alcohol denat", "Isopropyl Alcohol", "Isopropanol Alcohol", "Benzyl Alcohol"] 

    @@all_good_ingredients = []
    @@all_bad_ingredients = []
        
    attr_accessor :name, :product

    def initialize(name, product)
        @name = name
        @product = product
        add_to_product 
    end

    def add_to_product 
        if @@good_alcohol_list.include?(name) 
            @@all_good_ingredients  << self
            @product.ingredients << self unless @product.ingredients.include?(name)
        end

        if @@bad_alcohol_list.include?(name) 
            @@all_bad_ingredients  << self
            @product.ingredients << self unless @product.ingredients.include?(name)
        end
    end

    def self.good_ingredients_for_product(product)
        @@all_good_ingredients .select do |ingredient|
            ingredient.product == product
        end
    end

    def self.bad_ingredients_for_product(product)
        @@all_bad_ingredients .select do |ingredient|
            ingredient.product == product
        end
    end

    # def self.good_ingredients_for_product(product, array)
    #     self.array.select do |ingredient|
    #         ingredient.product == product
    #     end
    # end

    # def self.all_good_ingredients 
    #     @@all_good_ingredients 
    # end

    # def self.all_bad_ingredients 
    #     @@all_bad_ingredients 
    # end

    def self.view_good_list
        @@good_alcohol_list
    end

    def self.view_bad_list
        @@bad_alcohol_list
    end

end