#Responsibility of CLI: just to interact with user. not to go out and get data.

class CurlyProductCheck::CLI

    def call #this method runs in our execuitble file: bin/curly_product_check
        puts "\nWelcome to the Curly Product Check App for Ulta Beauty Online!
              \nUse this CLI App to select a product and find out if the ingredients contains a helpful or harmful alcohol for your curls.
              \nLet's Get Started!\n"
              
    #order of methods:
    #categories
        get_categories
        show_categories 
        get_user_category
    #brands
       # get_user_brand
       # get_brands
    # #products
        # get_products
        # #info
    end

    #HIDDEN::::::::::::::::
    # HIDDEN ____________________________________________________________________
    def valid_input(user_input, data) 
        user_input.to_i <= data.length && user_input.to_i > 0
    end 
    # __________________________________________________________________________

#layer 1 - CATEGORY
    def get_categories #LIST 
        @category = CurlyProductCheck::Category.all
        #goes to category.rb and calls all method - which actually calls scraper 
    end

    def show_categories #LIST
        puts "\nHair Categories:"
        @category.each.with_index(1) do |x, index| #has an argument? Oh this is to say start at 1 instead of default 0
            puts "  #{index}. #{x.name}"  
        end
        puts "\nSelect a Hair Category by typing the number and press enter:"
    end
#layer 1 gets strip - calls layer 2 showbrands_for
    def get_user_category #LIST
        chosen_category = gets.strip.to_i #setting local var to user choice/strip  #user_input = gets.strip.to_i
        show_brands_for(chosen_category) if valid_input(chosen_category, @category)
        #calling ("display"/scraper) method below for this category variable, if valid input.
    end

# #layer 2 - BRAND
    def show_brands_for(chosen_category) #HIDDEN
        category = @category[chosen_category - 1]
        #local var = instance cat var (of # minus 1)
        category.get_brand_scrape # calling category.rb
        #calling instance cat . method in category.rb - which calls scraper
        
        #display:
        puts "\nBrands for: #{category.name}"
        category.brand.each.with_index(1) do |brand, index|
            puts "  #{index}. #{brand.name}"
        end
        puts "\nSelect a brand by typing the number and press enter:"
    end

#     ##########################################################################################
# #layer 3 - PRODUCT

#     def get_user_brand #LIST
#         chosen_brand = gets.strip.to_i
#         show_products_for(chosen_brand) if valid_input(chosen_brand, @brand)
#     end

#     def get_brands      
#         @brand = CurlyProductCheck::Brand.all
#     end

#     def show_products_for(chosen_brand) #hidden
#         brand = @brand[chosen_brand - 1] #"SoCozy" / string
#         #brand.get_product_scrape
#         #      #CurlyProductCheck::Product.new("name - ProdA", brand) #test product data 
#         #      #CurlyProductCheck::Product.new("name - ProdB", brand) #test product data 
#         #     # puts @product.all
        
#         # #     #binding.pry
        
#         #      brand.get_product_scrape #calling brand.rb -- "brand.@product" to scrape/get products - returns products
#         # #     #THIS LINE IS A PROB!!!!!!!!!!!!!!!!!!!!!!
#         # #  #   puts "\nProducts for: #{brand.name}"   
        
#         # #     # puts "\nProducts for: #{brand.name}"
#         # #     # brand.product.each.with_index(1) do |product, index|
#         # #     #     puts "  #{index}. #{product.name}"
#         # #     # end
#             puts "YOUR PRODUCT SELECTED & #{chosen_brand}. #{brand}"
#         end







# #################################################

# def get_products
#     @product = CurlyProductCheck::Product.all      
# end



 end











    
    #second layer - for brands


    # def input_to_index(user_input)
    #     user_input.to_i-1
    # end

   
    
    #select_category(user_input)

    #puts "Type the number to select the Brand Name:"
    
    #scrape_brand_name

    #user_input (brand name)

    #puts "Type the number to select the Product:"
    
    #scrape_product

    #user_input (product)

    #display_product

    #call_menu