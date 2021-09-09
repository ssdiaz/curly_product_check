#Responsibility: Scrape the data needed.

class CurlyProductCheck::Scraper

    def self.scrape_categories 
        #only needs to scrape this once. not per instance, so listed as class method (self.methodname)
        
        site = "https://www.ulta.com/hair?N=26wz"
        valid_categories = ["Shampoo & Conditioner", "Treatment", "Styling Products", "Hair Color",  "Kid's Haircare", "Travel Size"]

        doc = Nokogiri::HTML(open(site))

        category_list = doc.css("li.cat-sub-nav a")
        category_list.each do |i|
            name = i.text.strip
            url = i.attr("href")
            CurlyProductCheck::Category.new(name, url) if valid_categories.include?(name)
        end
    end

    def self.scrape_brands(category)
        @category = category
        url = "https:#{category.url}"
        doc = Nokogiri::HTML(open(url))

        brand = doc.css("h4.prod-title a")
        brands_scraped= []
        brand.each do |i|
            name = i.text.strip
            url_brand = i.attr("href")
            CurlyProductCheck::Brand.new(name, category, url_brand) unless brands_scraped.include?(name)              # CurlyProductCheck::Brand.new(name, category) unless CurlyProductCheck::Brand.all.include?(name)
            brands_scraped << name
        end
    end

    def self.scrape_products(brand)
        @brand = brand
        url = "https:#{@category.url}"
        doc = Nokogiri::HTML(open(url))

        product = doc.css("div.prod-title-desc")
        product.each do |i|
            product_brand = i.css("h4").text.strip!
            url_product = i.css("h4").css("a").attr("href")
            product_name = i.css("p").text.strip!

            if product_brand == brand.name
                CurlyProductCheck::Product.new(product_name, brand, url_product)
            end
        end
    end

    def self.scrape_ingredients(product)
        url = "https://www.ulta.com#{@brand.url}"
        doc = Nokogiri::HTML(open(url))

        ingredient_string = doc.css("div.ProductDetail__ingredients").text
        ingredient_array = ingredient_string.split(", ")

        ingredient_array.each do |i|
            name = i
            CurlyProductCheck::Ingredient.new(name, product)
        end
    end

end