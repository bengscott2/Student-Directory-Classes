class Alerts
  def self.successful_load
    puts 'File successfully loaded.'
  end

  def self.successful_save
    puts 'File succesfully saved.'
  end

  def self.overwrite_warning
    puts 'Warning: If you proceed you will lose your current working directory'
    puts "Please type 'yes' to proceed"
    gets.chomp
  end
end
