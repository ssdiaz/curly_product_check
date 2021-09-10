#Responsibility of CLI: just to interact with user.

class CurlyProductCheck::CLI

    def greeting
        puts "\nWelcome to the Curly Product Check App for Ulta Beauty Online!
              \nUse this CLI App to select a product and find out if the ingredients contains a helpful or harmful alcohol for your curls.
              \nSources: 
    https://www.naturallycurly.com/curlreading/home/good-alcohols-vs-bad-alcohols
    https://www.ulta.com/
              \n\nLet's Get Started!\n\n"
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
        puts "Select a Category:"
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
        puts "\nBrands for: #{@category_chosen.name}"
        @category_chosen.brands.each.with_index(1) do |brand, index|
            puts "  #{index}. #{brand.name}"
        end
    end

    def get_user_brand
        puts "Select a Brand:"
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
        puts "Products for: #{@brand_chosen.name}"

        @brand_chosen.products.each.with_index(1) do |product, index|
            puts "  #{index}. #{product.name}"
        end
    end

    def set_products
        @products = CurlyProductCheck::Product.find_products_for_brand(@brand_chosen)
    end

    def get_user_product
        puts "Select a Product:"
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
         puts "Product chosen: #{@product_chosen.name}\n"
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
                puts "\nThis product contains: Good Alcohols."
                puts "  Good Alcohols are fatty, long-chained alcohols which provide moisture to curls."
                @good_ingredients.each.with_index(1) do |ingredient, index|
                    puts "   #{index}. #{ingredient.name}"
                end              
            end
            if @bad_ingredients.any?
                puts "\nThis product contains: Unfavorable Alcohols"
                puts "  Unfavorable alcohols are short-chained alcohols which strip the hair of moisture and often cause frizz."
                @bad_ingredients.each.with_index(1) do |ingredient, index|
                    puts "   #{index}. #{ingredient.name}"
                end
            end
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
        puts "\nWould you like to search again? Type Y/N:"
        user_answer = gets.strip.to_s
        if user_answer == "y" || user_answer == "Y"
            call
        elsif user_answer == "n" || user_answer == "N"
            puts "\nProgram Terminated. Have a nice Day!"
        else
            print "Unidentified character. "
            search_again
        end
    end

end