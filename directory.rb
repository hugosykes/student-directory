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
@filename = ''

def interactive_menu
  try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
    save_students
  end
end


def print_menu
  puts "Type the corresponding number to select that option:"
  puts "1. Input students"
  puts "2. Print out all the students and their corresponding cohort"
  puts "3. Load students"
  puts "4. Remove students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    load_students
  when "4"
    remove_student
  when "9"
    exit
  else
    puts "I'm sorry, I don't understand..."
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "Press enter twice after entering the last name"
  name = STDIN.gets.chomp.capitalize
  while !name.empty?
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp.capitalize
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end


def remove_student
  puts "Enter name of student you want to remove:"
  name = STDIN.gets.chomp.capitalize
  return if name.nil?
  puts "Now enter the name of the file you want to remove the name from if you choose"
  filename = STDIN.gets.chomp
  if filename == ''
    filename = "students.csv"
  end
  @students.each_with_index { |a,idx| @students.delete_at(idx) if a[:name] == name}
  remove_line_from_csv(name,filename)
end


def remove_line_from_csv(name,filename)
  file = File.open(filename, "r")
  file2 = File.open("dummy.csv", "w")
  file.readlines.each do |line|
    next if line.include?(name)
    file2.puts line
  end
  file.close
  file2.close
  File.delete(filename)
  File.rename("dummy.csv", filename)
end


def try_load_students
  @filename = ARGV.first
  if @filename.nil?
    @filename = "students.csv"
    load_students(@filename)
  elsif File.exists?(@filename)
    load_students(@filename)
    puts "Loaded #{@students.count} from #{@filename}"
  else
    puts "Sorry, \"#{@filename}\" doesn't exist"
    exit
  end
end



interactive_menu
