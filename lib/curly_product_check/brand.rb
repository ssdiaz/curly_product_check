class CurlyProductCheck::Brand
    @@all = [] 

    attr_accessor :name, :category, :products

    def initialize(name, category)
        @name = name
        @category = category
        @products = []
        save 
        add_to_category 
    end

    def self.all
        @@all
    end

    def save
       @@all << self unless @@all.include?(self)  
    end

    def add_to_category
        @category.brands << self unless @category.brands.include?(name)
    end

    def self.find_brands_for_category(category)
        self.all.select do |brand|
            brand.category == category
        end
    end

    def scrape_products
        CurlyProductCheck::Scraper.scrape_products(self) if @products.empty?
    end

end
