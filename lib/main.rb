require './menu.rb'
require './user-input.rb'

menu = Menu.new
loop do
menu.process_selection(menu.print_menu)
end
