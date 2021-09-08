#Responsibility of CLI: just to interact with user. 
#   not to go out and get data.

class CurlyProductCheck::CLI

    def call
        puts "\nWelcome to the Curly Product Check App for Ulta Beauty Online!
              \nUse this CLI App to select a product and find out if the ingredients contains a helpful or harmful alcohol for your curls.
              \nLet's Get Started!\n\n"
              
        #order of methods:
        set_categories
        display_categories 
        get_user_category

        set_brands
        get_user_brand

        set_products
        get_user_product

        #check_ingredients_list
       # set_ingredients
    end

    def set_categories      
        @category = CurlyProductCheck::Category.all
    end

    def display_categories
        puts "\nHair Categories:"
        @category.each.with_index(1) do |x, index|
            puts "  #{index}. #{x.name}"  
        end
        puts "Select a Category:"
    end

    def get_user_category
        chosen_category = gets.strip.to_i 
        show_brands_for(chosen_category) if valid_input(chosen_category, @category)
    end

    def valid_input(user_input, data)
        user_input.to_i <= data.length && user_input.to_i > 0
    end

    def show_brands_for(chosen_category)
        category = @category[chosen_category - 1]
        category.get_brands
       # binding.pry
        puts "\nBrands for: #{category.name}"
        category.brands.each.with_index(1) do |brand, index|
            puts "  #{index}. #{brand.name}"
        end
        puts "Select a Brand:"
    end

    def set_brands  #["SoCozy", "Fairy Tales", "Babo Botanicals", "Wet Brush", "Invisibobble"]    
        @brand = CurlyProductCheck::Brand.all
    end

    def get_user_brand
        chosen_brand = gets.strip.to_i 
        show_products_for(chosen_brand) if valid_input(chosen_brand, @brand) #why does this mess up?????
    end

    def show_products_for(chosen_brand)
        brand = @brand[chosen_brand - 1]
        brand.get_products 
        puts "Products for: #{brand.name}"

        brand.products.each.with_index(1) do |product, index|
            puts "  #{index}. #{product.name}"
        end
        puts "Select a Product:"
    end

    def set_products
        @product = CurlyProductCheck::Product.all
    end

    def get_user_product
        chosen_product = gets.strip.to_i 
        show_ingredients_for(chosen_product) if valid_input(chosen_product, @product)
    end 

    def show_ingredients_for(chosen_product)
        product = @product[chosen_product - 1]
        product.get_ingredients
        puts "Ingredients for: #{product.name}"

        product.ingredients.each.with_index(1) do |ingredient, index|
            puts "  #{index}. #{ingredient.name}"
            #puts "#{ingredient.name}" if @products.include?(CurlyProductCheck::Ingredient.GOOD_ALCOHOL)
            
        end

    end

    #here, need to do an alchol check? or where does that belong... in ingredients?
    #need to display ONLY alcohol ingredietns and a little blurb
    #so, I think this belongs in ingredient check, and here only displays alcohols
    # def display_alcohol_ingredients
    # end


        # def run_check_ingredients(chosen_product)
    #     product = @product[chosen_product - 1]
    #     product.check_ingredients
    # end

    # def check_ingredients_list(chosen_product)
    #     # @product.each do |i|
    #     #     puts i if CurlyProductCheck::Ingredient.GOOD_ALCOHOL.include?(i)
    #     #     #puts"hi"
    #     # end
    #     product = @product[chosen_product - 1]
    #     product.ingredients.check_ingredients
    #     puts "end"
    # end



    # def set_ingredients
    #    @ingredients = CurlyProductCheck::Ingredient.all
    # end











end