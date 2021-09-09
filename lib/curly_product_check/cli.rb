#Responsibility of CLI: just to interact with user.

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

        set_ingredients
        display_ingredient_type

        search_again
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
        if valid_input(chosen_category, @category)
            show_brands_for(chosen_category)
        else
            puts "Unidentified response. Please type a number, 1-#{@category.count}:"
            get_user_category
        end 
    end

    def valid_input(user_input, data)
        user_input.to_i <= data.length && user_input.to_i > 0
    end

    def show_brands_for(chosen_category)
        category = @category[chosen_category - 1]
        category.get_brands
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
        if valid_input(chosen_brand, @brand) 
            show_products_for(chosen_brand)
        else
            puts "Unidentified response. Please type a number, 1-#{@brand.count}:"
            get_user_brand
        end 
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
        if valid_input(chosen_product, @product)
            show_ingredients_for(chosen_product)
        else
            puts "Unidentified response. Please type a number, 1-#{@product.count}:"
            get_user_product
        end 
    end

    def show_ingredients_for(chosen_product)
        @product_chosen = @product[chosen_product - 1]
        @product_chosen.get_ingredients
        
         puts "Product chosen: #{@product_chosen.name}\n"
    end

    def set_ingredients
        @good_ingredients = CurlyProductCheck::Ingredient.all_good
        @bad_ingredients = CurlyProductCheck::Ingredient.all_bad
        @good_list = CurlyProductCheck::Ingredient.view_good_list
        @bad_list = CurlyProductCheck::Ingredient.view_bad_list
    end

    def display_ingredient_type
        if @good_ingredients.any? 
            puts "This product contains: Good Alcohols"
            @good_ingredients.each.with_index(1) do |ingredient, index|
                puts "   #{index}. #{ingredient.name}"
            end  
            puts "  Good Alcohols are fatty, long-chained alcohols which provide moisture to curls."
            puts "  Source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols"              
        
        elsif @bad_ingredients.any?
            puts "This product contains: Unfavorable Alcohols"
            @bad_ingredients.each.with_index(1) do |ingredient, index|
                puts "   #{index}. #{ingredient.name}"
            end
            puts "  Unfavorable alcohols are short-chained alcohols which strip the hair of moisture and often cause frizz."
            puts "  Source: https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols"
       
        else 
           puts "This product does not contain any of the below ingredients:"
            print "  Good Alcohols: "
                @good_list.each.with_index(1) do |i, index|
                    print "  #{index}. #{i}" 
                end        
            print "\n  Unfavorable Alcohols: "
                @bad_list.each.with_index(1) do |i, index|
                    print "  #{index}. #{i}" 
                end
        end
    end

    def search_again
        puts "\nWould you like to search again? Please type y/n:"
        user_answer = gets.strip.to_s
        if user_answer == "y" || user_answer == "Y"
            call
        elsif user_answer == "n" || user_answer == "N"
            puts "Program Terminated. Have a nice Day!"
        else
            print "Unidentified character. "
            CurlyProductCheck::Brand.clear
            CurlyProductCheck::Product.clear
            CurlyProductCheck::Ingredient.clear
            search_again
        end
    end

end