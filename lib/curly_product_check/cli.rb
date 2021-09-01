#Responsibility of CLI: just to interact with user. 
#   not to go out and get data.

class CurlyProductCheck::CLI

    def call
        puts "\nWelcome to the Curly Product Check App for Ulta Beauty Online!
              \nUse this CLI App to select a product and find out if the ingredients contains a helpful or harmful alcohol for your curls.
              \nLet's Get Started!\n"
              
        #order of methods:
        get_categories
        display_categories #aka list_categories
        get_user_category
    end

    def get_categories      
        @category = CurlyProductCheck::Category.all

        #shovels in valid cats. in new array ---> should go in scrape_categories???
        # categories_array = []
        # @category.each do |x|
        #     if VALID_CATEGORIES.include?(x)
        #       categories_array << x
        #     end
        #  end         
         #note: this also works: puts @categories & VALID_CATEGORIES 
    end

    def display_categories
        puts "\nHair Categories:"
        @category.each.with_index do |x, index|
            puts "  #{index+1}. #{x.name}"  #above has argument? :  @category.each.with_index(1) do |x, index|
        end
        puts "\nSelect a Hair Category above by typing the number and press enter:"
    end

    def get_user_category
        chosen_category = gets.strip.to_i  #user_input = gets.strip.to_i
        show_brands_for(chosen_category) if valid_input(chosen_category, @category)
    end

    def valid_input(user_input, data)
        user_input.to_i <= data.length && user_input.to_i > 0
    end

    def show_brands_for(chosen_category)
        category = @category[chosen_category - 1]
        puts "Select a brand: #{category.name}"
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

    
