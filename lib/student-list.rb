require './student'
require './user-input'
require './alerts'
require 'csv'

class StudentList
  def initialize
  @student_list = []
  end

  def add_student(name, cohort)
    student = Student.new
    student.name = name
    student.cohort = cohort
    @student_list << student
  end

  def load_students(filename)
    return if Alerts.overwrite_warning != 'yes'
    @student_list = []
    CSV.foreach(filename) do |row|
      name, cohort = row
      add_student(name, cohort)
    end
    Alerts.successful_load
  end

  def save_students(filename)
    CSV.open(filename, 'wb') do |csv|
      @student_list.each do |student|
        student_data = [student.name, student.cohort]
        csv << student_data
      end
    end
    Alerts.successful_save
  end

  def show_students
    print_header
    print_students_list
    print_footer
  end

  def print_students_list
    @student_list.each do |student|
      puts "#{student.name} (#{student.cohort} cohort)"
    end
  end

  def print_header
    puts 'The students of Villains Academy'
    puts '-------------'
  end

  def print_footer
    puts "Overall, we have #{@student_list.count} great students"
  end

end
