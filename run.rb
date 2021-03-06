require_relative 'employee.rb'
require_relative 'product.rb'
require_relative 'startup.rb'
require_relative 'menus.rb'
require_relative 'UI.rb'
require_relative 'tech_name_generator.rb'
include NamesVariables
# require_relative 'ui_generator.rb'
require 'pry'
require 'colorize'


def begin_game

    week = 1;

##Generate Menus##
    #Generate Startup
    our_startup = Startup.new("No Name")
    
    ## START GAME UI ##
    start_game_ui = UI.new("start_game_ui")
    start_game_ui.menu_items = ["[1] - Yes", "[2] - Generate Another"]
    ##set up logic##
    start_game_ui.set_logic("return_value", start_game_ui.method(:prompt_generate))
    start_game_ui.body = ("Do you want to use this as your company name?")
    start_game_ui.has_border = true

    ###################
    ## Create your own startup name or generate? ##
    create_or_generate_ui = UI.new("create_or_generate_ui")
    create_or_generate_ui.menu_items = ["[1] - Create My Own", "[2] - Generate A Name"]
    create_or_generate_ui.header = "NAME YOUR STARTUP"
    create_or_generate_ui.has_border = true
    create_or_generate_ui.set_logic(start_game_ui.method(:get_return_value), start_game_ui.method(:prompt_generate))
    

    
    ## Main Menu ##
    
    main_menu_ui = UI.new("main_menu_ui")
    main_menu_ui.menu_items = ["[1] - Try to Raise Capital  ", "[2] - Hire Employees        ", "[3] - Build/Improve Products",
                            "[4] - View Company", "[5] - View Employees", "[6] - View Products"]
    main_menu_ui.header = "                               MAIN MENU - Week: #{week}"
    main_menu_ui.body = "            #{our_startup.name}\n Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}"
    main_menu_ui.has_border = true
    main_menu_ui.border_type = "dash-lg"
    main_menu_ui.has_divider = true


    ## Try to raise capital menu

    raise_capital_ui = UI.new("raise_capital_ui")
    raise_capital_ui.menu_items = ["[1] - Friends and Family", "[2] - Local Investors", "[3] - Regional Investors", "[4] - Silicone Valley Gurus", 
                        "   [5] - Elite Venture Capitalists", "[6] - Public Offering"]
    raise_capital_ui.header = "                           RAISE CAPITAL - Week: #{week}"
    raise_capital_ui.body = "            #{our_startup.name}\n Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}"
    raise_capital_ui.has_border = true
    raise_capital_ui.border_type = "dash-lg"
    raise_capital_ui.has_divider = true
    raise_capital_ui.parent_menu = main_menu_ui


    ## Hire Employees menu ##

    hire_employees_ui = UI.new("hire_employees_ui")
    hire_employees_ui.menu_items = ["[1] - Search For Employees", "[2] - Work On Existing Employees"]
    hire_employees_ui.header = "                           HIRE EMPLOYEES - Week: #{week}"
    hire_employees_ui.body = "            #{our_startup.name}\n Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}"
    hire_employees_ui.has_border = true
    hire_employees_ui.border_type = "dash-lg"
    hire_employees_ui.has_divider = true
    hire_employees_ui.parent_menu = main_menu_ui


    
    ## Build/Improve Products menu ##


    build_improve_prod_ui = UI.new("build_improve_prod_ui")
    build_improve_prod_ui.menu_items = ["[1] - Build New Product", "[2] - Work On Existing Product"]
    build_improve_prod_ui.header = "                       BUILD / IMPROVE PRODUCTS - Week: #{week}"
    build_improve_prod_ui.body = "            #{our_startup.name}\n Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}"
    build_improve_prod_ui.has_border = true
    build_improve_prod_ui.border_type = "dash-lg"
    build_improve_prod_ui.has_divider = true
    build_improve_prod_ui.parent_menu = main_menu_ui



    ## View Company ##


    view_company_ui = UI.new("view_company_ui")
    view_company_ui.menu_items = ["[1] - Build New Product", "[2] - Work On Existing Product"]
    view_company_ui.header = "                           COMPANY PANEL - Week: #{week}"
    view_company_ui.body = "            #{our_startup.name}\n Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}"
    view_company_ui.has_border = true
    view_company_ui.border_type = "dash-lg"
    view_company_ui.has_divider = true
    view_company_ui.parent_menu = main_menu_ui



    ## View Employees ##


    view_employees_ui = UI.new("view_employees_ui")
    view_employees_ui.menu_items = ["[1] - Build New Product", "[2] - Work On Existing Product"]
    view_employees_ui.header = "                           EMPLOYEE PANEL - Week: #{week}"
    view_employees_ui.body = "            #{our_startup.name}\n Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}"
    view_employees_ui.has_border = true
    view_employees_ui.border_type = "dash-lg"
    view_employees_ui.has_divider = true
    view_employees_ui.parent_menu = main_menu_ui




    ## View Products ##


    view_products_ui = UI.new("view_products_ui")
    view_products_ui.menu_items = ["[1] - Build New Product", "[2] - Work On Existing Product"]
    view_products_ui.header = "                           PRODUCTS PANEL - Week: #{week}"
    view_products_ui.body = "            #{our_startup.name}\n Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}"
    view_products_ui.has_border = true
    view_products_ui.border_type = "dash-lg"
    view_products_ui.has_divider = true
    view_products_ui.parent_menu = main_menu_ui



   ##Choose Employee to Hire 
    emp = Employee.three_emps
    choose_employee_ui = UI.new("choose_employee_ui")
    choose_employee_ui.menu_items =["[1] #{emp[0].name} -> " + "Salary:" + "$#{emp[0].salary}, " + "Personality:" + " #{emp[0].personality}, " + "Job:" + " #{emp[0].job}," + " Skill Level:" + " #{emp[0].skill_level}",  "[2] #{emp[1].name} -> " + "Salary:" + "$#{emp[1].salary}, " + "Personality:" + " #{emp[1].personality}, " + "Job:" + " #{emp[1].job}," + " Skill Level:" + " #{emp[1].skill_level}", "[3] #{emp[2].name} -> " + "Salary:" + "$#{emp[2].salary}, " + "Personality:" + " #{emp[2].personality}, " + "Job:" + " #{emp[2].job}," + " Skill Level:" + " #{emp[2].skill_level}", "","",""]
    choose_employee_ui.header = "                           CHOOSE EMPLOYEES - Week: #{week}"
    choose_employee_ui.question_prompt = "\nChoose an Employee to hire!".green 
    
    
    
    
    
    
    # choose_employee_ui.body ="             #{emp[0].name}, #{emp[1].name}, #{emp[2].name}\n             #{emp[0].salary}, #{emp[1].salary}, #{emp[2].salary}\n             #{emp[0].personality}, #{emp[1].personality}, #{emp[2].personality}\n             #{emp[0].job}, #{emp[1].job}, #{emp[2].job}\n             #{emp[0].skill_level}, #{emp[1].skill_level}, #{emp[2].skill_level}"
    # choose_employee_ui.body = "             #{emp[0].name} -> " + "Salary:" + "$#{emp[0].salary}, " + "Personality:" + " #{emp[0].personality}, " + "Job:" + " #{emp[0].job}," + " Skill Level:" + " #{emp[0].skill_level}\n
    #          #{emp[1].name} -> " + "Salary:" + "$#{emp[1].salary}, " + "Personality:" + " #{emp[1].personality}, " + "Job:" + " #{emp[1].job}," + " Skill Level:" + " #{emp[1].skill_level}\n             
    #          #{emp[2].name} -> " + "Salary:" + "$#{emp[2].salary}, " + "Personality:" + " #{emp[2].personality}, " + "Job:" + " #{emp[2].job}," + " Skill Level:" + " #{emp[2].skill_level}"


    
    
    
    ### CREATE MENU LOGIC HERE WHEN LINKING TOGETHER MENUS ###
    instantiate_employees


    

    main_menu_ui.set_logic(raise_capital_ui.method(:prompt), hire_employees_ui.method(:prompt), build_improve_prod_ui.method(:prompt),
view_company_ui.method(:prompt), view_employees_ui.method(:prompt), view_products_ui.method(:prompt) )

    a = lambda {Employee.three_emps}
    emp1 = lambda {our_startup.hire_employee(emp[0])}
    emp2 = lambda {our_startup.hire_employee(emp[1])}
    emp3 = lambda {our_startup.hire_employee(emp[2])}


    hire_employees_ui.set_logic(choose_employee_ui.method(:prompt))
    choose_employee_ui.set_logic(emp1, emp2, emp3)

    binding.pry





#########GAME BEGINS HERE####################

    UI.announce("WELCOME TO STARTUP SIMULATOR!!!")
    UI.blank_space(5)

    our_startup.player_name = UI.simple_question("What is your name?")

    UI.blank_space(5)
    puts "Hi, #{our_startup.player_name} congratulations on becoming"
    puts "an entreprenuer!"
    UI.ask_for_enter
    create_or_generate_ui.prompt
    our_startup.name = start_game_ui.return_value


    
    
    ## this is generating a name and asking player to choose if
    ## they want it or if they want it to 

    
    UI.announce("Congrats! #{our_startup.name} has been created","blue")
    UI.announce("Time to raise some capital and get this thing started!","green")
    
    main_menu_ui.header = "                     MAIN MENU - Week: #{week}"
    main_menu_ui.body = "                        #{our_startup.name}\n              Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}".blue
    
    raise_capital_ui.header = "                           RAISE CAPITAL - Week: #{week}"
    raise_capital_ui.body = "                        #{our_startup.name}\n              Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}".blue
    
    hire_employees_ui.header = "                           HIRE EMPLOYEES - Week: #{week}"
    hire_employees_ui.body = "                        #{our_startup.name}\n              Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}".blue
    
    build_improve_prod_ui.header = "                       BUILD / IMPROVE PRODUCTS - Week: #{week}"
    build_improve_prod_ui.body = "                        #{our_startup.name}\n              Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}".blue
    
    view_company_ui.header = "                           COMPANY PANEL - Week: #{week}"
    view_company_ui.body = "                        #{our_startup.name}\n              Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}".blue
    
    view_employees_ui.header = "                           EMPLOYEE PANEL - Week: #{week}"
    view_employees_ui.body = "                        #{our_startup.name}\n              Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}".blue
    
    view_products_ui.header = "                           PRODUCTS PANEL - Week: #{week}"
    view_products_ui.body = "                        #{our_startup.name}\n              Funds: #{our_startup.funds} Employees: #{our_startup.employees.count} Products: #{our_startup.products.count}".blue
    
    
    
    main_menu_ui.prompt 
    binding.pry
    
    
    
end




def instantiate_employees
    names = ["Alice", "Barry", "Charlie", "Adam", "Edgar", "Avi",
    "Matthew", "Jerry", "Darius", "Billy", "Jay", "Steph", "Mary",
    "Jalapeno", "Sarah", "Meghan"]

    names.each do |name|
        name = Employee.new(name)
    end
end



instantiate_employees
begin_game

