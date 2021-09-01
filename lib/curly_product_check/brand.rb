#Responisbility
#Brand have many products. But one category? 

class CurlyProductCheck::Brand
    @@all = [] 
        
    attr_accessor :name, :category, :products, :ingredients

    def initialize(name, category)
        @name = name
        @category = category
       # @product = []
        add_to_category         #notify category(month) of brand(event)
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def add_to_category #instance - calling on one intance
        @category.brand << self unless @category.brand.include?(self)
    end

end