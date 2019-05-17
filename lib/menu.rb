require './student-list'
require './user-input'

class Menu

  def initialize
    @student_list = StudentList.new
  end

  def print_menu
    puts '**************************'
    puts '1. Input students'
    puts '2. Show current students'
    puts '3. Save list of students'
    puts '4. Load list of students'
    puts '9. Exit'
    puts '**************************'
  end

  def process_selection(selection)
    case selection
    when '1'then @student_list.add_student(UserInput.get_name, UserInput.get_cohort)
    when '2'then @student_list.show_students
    when '3'then @student_list.save_students(UserInput.ask_for_filename)
    when '4'then @student_list.load_students(UserInput.ask_for_filename)
    when '9'then exit
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
    @students = []
    CSV.foreach(filename) do |row|
      name, cohort = row
      add_student(name, cohort)
    end

    puts 'File successfully loaded.'
  end


end
