=begin
students = [
  {name: "Dr Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end

@students = []


def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


def print_menu
  puts "Type the corresponding number to select that option:"
  puts "1. Input students"
  puts "2. Print out all the students and their corresponding cohort"
  puts "3. Save students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I'm sorry, I don't understand..."
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "Press enter twice after entering the last name"
  name = gets.chomp
  while !name.empty?
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end


def show_students
  print_header
  print_students
  print_footer
end


def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end


def print_students
  @students.each_with_index { |a,idx| puts "#{idx+1}.  #{a[:name]} (#{a[:cohort]} cohort)"}
end


def print_footer
  puts @students.count != 1 ? "Overall, we have #{@students.count} great students" : "Overall, we have #{@students.count} great student"
end


def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


interactive_menu
