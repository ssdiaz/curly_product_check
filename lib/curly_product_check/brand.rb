#Responsibility: Brand Class
# Has many products. But one category (?) 

class CurlyProductCheck::Brand
    @@all = [] 
        
    attr_accessor :name, :category, :products, :ingredients, :url

    BRANDS = []

    def initialize(name, category)
        @name = name
        @category = category
       # @product = []
        add_to_category         #notify category(month) of brand(event)
       
        @@all << name unless BRANDS.include?(name)  #save
    end

    def self.all
        @@all
    end

    # def save
    #     @@all << self unless BRANDS.include?(self)
    # end

    def add_to_category #instance - calling on one intance
        @category.brand << self unless @category.brand.include?(self)
    end

end