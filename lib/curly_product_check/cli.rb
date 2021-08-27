class CurlyProductCheck::CLI
    def call
        puts "Welcome to the Curly Product Check App for Ulta Beauty Online!
        Use this CLI App to select a product and find out if the ingredients contains a helpful or harmful alcohol for your curls.
                
        Let's Get Started!

        Select a Hair Category by typing the number in the terminal and press enter:"
        
        scrape_categories
        get_user_category

    end


    def scrape_categories
        #need to scrape this
        @category = ["Shampoo & Conditioner", "Treatment", "Styling Products", "Hair Color", "Hair Styling Tools", "Hair Brushes & Combs", "Accessories", "Kid's Haircare", "Travel Size", "Gifts & Value Sets"]
    end

    # #hide_tool_categories
    # #display_categories

    def get_user_category
        #list categories
        @category.each_with_index do |category, index| 
            puts "#{index}. #{category}"    
        end
    end

    # def input_to_index(input)
    #     input.to_i-1
    # end



    #select_category(user_input)
   
       

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

    
