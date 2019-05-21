require './student-list'
require './user-input'
require 'tty-prompt'

class Menu

  def initialize
    @student_list = StudentList.new
    @prompt = TTY::Prompt.new
  end

  def print_menu
    @prompt.select("Please choose one of the following options.") do |menu|
      menu.enum '.'

      menu.choice 'Input students', 1
      menu.choice 'Show current students', 2
      menu.choice 'Save list of students', 3
      menu.choice 'Load list of students', 4
      menu.choice 'Exit', 9
    end
  end

  def process_selection(selection)
    case selection
    when 1then @student_list.add_student(UserInput.get_name, UserInput.get_cohort)
    when 2then @student_list.show_students
    when 3then @student_list.save_students(UserInput.ask_for_filename)
    when 4then @student_list.load_students(UserInput.ask_for_filename)
    when 9then exit
    else puts "I don't know what you mean try again."
    end
  end

  def save_students(filename)
    CSV.open(filename, 'wb') do |csv|
      @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv << student_data
      end
    end
    puts 'File succesfully saved.'
  end

  def load_students(filename)
    if File.exist?(filename)
      @students = []
      CSV.foreach(filename) do |row|
        name, cohort = row
        add_student(name, cohort)
      end
      puts 'File successfully loaded.'
    else
      puts 'No such file exists'
    end
  end

end
