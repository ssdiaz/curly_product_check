class CurlyProductCheck::CLI

    #HIDE_TOOLS_CATEGORIES = ["Hair Styling Tools", "Hair Brushes & Combs", "Accessories", "Gifts & Value Sets"]
    VALID_CATEGORIES = ["Shampoo & Conditioner", "Treatment", "Styling Products", "Hair Color",  "Kid's Haircare", "Travel Size"]

    def call
        puts "\nWelcome to the Curly Product Check App for Ulta Beauty Online!
              \nUse this CLI App to select a product and find out if the ingredients contains a helpful or harmful alcohol for your curls.\n
              \nLet's Get Started!\n\n"
        
        #order of methods:
        scrape_categories
        display_categories #aka list_categories
        #get_user_category()
    end

    def scrape_categories
    #TODO ***** need to scrape this *****
        category_scrape = ["Shampoo & Conditioner", "Treatment", "Styling Products", "Hair Color", "Hair Styling Tools", "Hair Brushes & Combs", "Accessories", "Kid's Haircare", "Travel Size", "Gifts & Value Sets"]

        #shovels in valid cats. in new array ---> should go in scrape_categories???
        @categories = []
        category_scrape.each do |x|
            if VALID_CATEGORIES.include?(x)
              @categories << x
            end
         end         
         #note: this also works: puts @categories & VALID_CATEGORIES 
    end

    def display_categories
        puts "Hair Categories:"
        @categories.each.with_index do |x, index|
            puts "  #{index+1}. #{x}"  
        end
        puts "\nSelect a Hair Category above by typing the number and press enter:\n"
    end

#this is where I need to pick up, and create scrape for scrape_categories

    def get_user_category
        chosen_cat = gets.strip
        #user_input = gets.strip
        
        if valid_input(user_input)
            chosen_cat.to_i <= @category.length && chosen_cat.to_i <0
        end
    end


   


    def valid_input(user_input, data)
        user_input.to_i <= @category.length && user_input.to_i <0
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

end

    
