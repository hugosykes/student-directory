students = [
  "Dr Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def print_students(arr)
  arr.each do |a|
    puts a
  end
end

def print_footer(arr)
  puts "Overall, we have #{arr.count} great students"
end

print_header
print_students(students)
print_footer(students)
