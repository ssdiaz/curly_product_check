#Responsibility of CLI: just to interact with user.

class CurlyProductCheck::CLI

    def greeting
        puts "\nWelcome to the Curly Product Check for Ulta Beauty Online!
              \nUse this CLI application to select a product and find out if the ingredients contain a helpful or harmful alcohol for your curls.
              \nSources: 
    https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols
    https://www.ulta.com/
              \n\nLet's Get Started!\n\n"
        call
    end

    def call
        #order of methods:
        set_categories
        display_categories 
        get_user_category

        get_user_brand

        set_products
        get_user_product

        set_ingredients
        display_ingredient_type

        search_again
    end

    def set_categories 
        @all_categories = CurlyProductCheck::Category.all
        CurlyProductCheck::Scraper.scrape_categories if @all_categories.empty?
    end

    def display_categories
        puts "\nHair Categories:"
        @all_categories.each.with_index(1) do |category, index|
            puts "  #{index}. #{category.name}"  
        end
    end

    def valid_input(user_input, data)
        user_input.to_i <= data.count && user_input.to_i > 0
    end

    def get_user_category
        puts "\nSelect a Category:"
        user_category = gets.strip.to_i 
        if valid_input(user_category, @all_categories)
            show_brands_for(user_category)
        else
            puts "Unidentified response. Please type a number 1-#{@all_categories.count}."
            get_user_category
        end 
    end

    def show_brands_for(user_category)
        @category_chosen = @all_categories[user_category - 1]
        @category_chosen.scrape_brands
        puts "\nBrands for - #{@category_chosen.name.upcase}"
        @category_chosen.brands.each.with_index(1) do |brand, index|
            puts "  #{index}. #{brand.name}"
        end
    end

    def get_user_brand
        puts "\nSelect a Brand:"
        user_brand = gets.strip.to_i 
        if valid_input(user_brand, @category_chosen.brands) 
            show_products_for(user_brand)
        else
            puts "Unidentified response. Please type a number, 1-#{@category_chosen.brands.count}"
            get_user_brand
        end 
    end

    def show_products_for(user_brand)
        brands_in_category = CurlyProductCheck::Brand.find_brands_for_category(@category_chosen)

        @brand_chosen = brands_in_category[user_brand - 1]
        @brand_chosen.scrape_products 
        puts "\nProducts for - #{@brand_chosen.name.upcase}"

        @brand_chosen.products.each.with_index(1) do |product, index|
            puts "  #{index}. #{product.name}"
        end
    end

    def set_products
        @products = CurlyProductCheck::Product.find_products_for_brand(@brand_chosen)
    end

    def get_user_product
        puts "\nSelect a Product:"
        user_product = gets.strip.to_i 

        if valid_input(user_product, @products)
            show_product_chosen(user_product)
        else
            puts "Unidentified response. Please type a number, 1-#{@products.count}:"
            get_user_product
        end 
    end

    def show_product_chosen(user_product) #show_ingredients_fors
        @product_chosen = @products[user_product - 1]
        @product_chosen.scrape_ingredients
         puts "\nProduct chosen - #{@product_chosen.name.upcase}"
    end

    def set_ingredients
        good = CurlyProductCheck::Ingredient.all_good_ingredients
        bad = CurlyProductCheck::Ingredient.all_bad_ingredients
        @good_ingredients = CurlyProductCheck::Ingredient.ingredients_for_product(@product_chosen, good)
        @bad_ingredients = CurlyProductCheck::Ingredient.ingredients_for_product(@product_chosen, bad)
        @good_list = CurlyProductCheck::Ingredient.view_good_alcohols
        @bad_list = CurlyProductCheck::Ingredient.view_bad_alcohols
    end

    def display_ingredient_type
        if @good_ingredients.any? || @bad_ingredients.any?
            if @good_ingredients.any? 
                puts "\n  This product contains: Helpful Alcohols"
                puts "    Helpful alcohols are fatty, long-chained alcohols which provide moisture to curls."
                @good_ingredients.each.with_index(1) do |ingredient, index|
                    puts "    #{index}. #{ingredient.name}"
                end
            else
                puts "\n  This product does not contain helpful alcohols."
            end
            if @bad_ingredients.any?
                puts "\n  This product contains: Harmful Alcohols"
                puts "    Harmful alcohols are short-chained alcohols which strip the hair of moisture and cause frizz."
                @bad_ingredients.each.with_index(1) do |ingredient, index|
                    puts "    #{index}. #{ingredient.name}"
                end
            else                 
                puts "\n  This product does not contain harmful alcohols."
            end
        else 
            puts "\n  This product does not contain any of the below ingredients:"
            print "    Helpful Alcohols:"
                @good_list.each.with_index(1) do |ingredient, index|
                    print " #{index}. #{ingredient} " 
                end        
            print "\n    Harmful Alcohols:"
                @bad_list.each.with_index(1) do |ingredient, index|
                    print " #{index}. #{ingredient} " 
                end
            puts "\n"
        end
    end

    def search_again
        puts "\nWould you like to search again? Type Y/N:"
        user_answer = gets.strip.to_s
        if user_answer == "y" || user_answer == "Y"
            call
        elsif user_answer == "n" || user_answer == "N"
            puts "\nProgram terminated. Have a nice day!"
        else
            print "Unidentified character. "
            search_again
        end
    end

end