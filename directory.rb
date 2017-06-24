# first, put all students into an array

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	#create an empty array
	students = []
	#get the first names
	puts "Please enter the names of the students"
	name = gets.chomp
	puts "Please enter the cohort"
	cohort = gets.chomp
	puts "Please enter your hobby"
	hobby = gets.chomp
	puts "Please enter your nationality"
	nationality = gets.chomp
	if name.to_s.empty?
		name = 'Default name'
	elsif cohort.to_s.empty?
		cohort = 'Default'
	end
	#while the name is not empty , repeat this code
	while !name.empty? do

		students << {name: name, cohort: cohort, hobby: hobby,nationality: nationality}
		puts "Now we have #{students.count} students"
		name = gets.chomp
		cohort =  gets.chomp
		hobby = gets.chomp
		nationality = gets.chomp

	end
	students
end

def print_header
	puts "The students of Villians Academy"
	puts "-----------"
end

def print(students)
	i = 0
	while i < students.count
		puts "#{students[i][:name]} (#{students[i][:cohort]} cohort) #{students[i][:hobby]} #{students[i][:nationality]} ".center(50)
		i = i+1
	end
end

# def print_by_letter(students,initial)
# 	students.each_with_index do |student,index|
# 		if student[:name][0] == initial
# 			puts puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) "
# 		end
# 	end
# end

def print_conditions(students,initial,size)
	students.each_with_index do |student,index|
		if student[:name].length <= size && student[:name][0] == initial.downcase
			 puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) ".center(50)
		end
	end
end




def print_footer(names)
	puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
# print_by_letter(students,'N')
print_conditions(students,'N',12)
print_footer(students)
