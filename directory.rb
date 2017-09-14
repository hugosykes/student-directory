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

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print_students(arr)
  idx = 0
  while idx < arr.length
    puts "#{idx+1}. #{arr[idx][:name]}  (#{arr[idx][:cohort]} cohort)"
    idx += 1
  end
end

def print_footer(arr)
  puts arr.count != 1 ? "Overall, we have #{arr.count} great students" : "Overall, we have #{arr.count} great student"
end

def input_students
  puts "Please enter the names of the students"
  puts "Press enter twice after entering the last name"
  name = gets.chomp
  students = []
  while !name.empty?
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def interactive_menu
  students = []
  loop do
    puts "Type the corresponding number to select that option:"
    puts "1. Input students"
    puts "2. Print out all the students and their corresponding cohort"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print_students(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I'm sorry, I don't understand..."
    end
  end
end

interactive_menu
