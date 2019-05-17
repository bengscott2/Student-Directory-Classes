require './menu.rb'
require './user-input.rb'

menu = Menu.new
loop do
menu.print_menu
menu.process_selection(UserInput.menu_selection)
end
