class CurlyProductCheck::Product
    @@all = [] 
        
    attr_accessor :name, :brand, :url, :products, :ingredients 

    def initialize(name, brand, url)
        @name = name
        @brand = brand
        @url = url
        @ingredients = []
        save 
        add_to_brand 
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

    def self.find_products_for_brand(brand)
        self.all.select do |product|
            product.brand == brand
        end
    end

    def scrape_ingredients
        CurlyProductCheck::Scraper.scrape_ingredients(self) if @ingredients.empty?
    end

end