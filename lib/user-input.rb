class UserInput

  def self.get_name
    puts 'Please enter the name of the student you would like to enter'
    gets.chomp.capitalize
  end

  def self.get_cohort
    puts 'Please enter the cohort'
    input = gets.chomp.capitalize
    return "Uknown" if input == ""
    input
  end

  def self.menu_selection
    gets.chomp
  end

  def self.ask_for_filename
    puts 'Please enter the filename you would like to use..'
    gets.chomp
  end

end
