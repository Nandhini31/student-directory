# first, put all students into an array
@students  = []

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save students list to students.csv"
	puts "4. Load the list from students.csv "
	puts "9. Exit"
end

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def process(selection)
	case selection
	when "1"
		input_students
		puts ""
	when "2"
		show_students
	when "3"
		save_students
		"Please enter the filename you wish to save along with the extention"
		user_filename = gets.chomp
	when "4"
		load_students_file
		"Please enter the filename you wish to load along with the extention"
		user_filename = gets.chomp
	when "9"
		exit
	else
		puts "I don't know what you mean try again"
	end
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	#get the first names
	name = STDIN.gets.chomp
	#while the name is not empty , repeat this code
	while !name.empty? do
		populate_array(name)
		 puts "Now we have #{@students.count} students"
		 name = STDIN.gets.chomp
	end
	puts "Successfully completed actions for Option 1"
end



def show_students
	print_header
	print_students_list
	print_footer

end


def print_header
	puts "The students of Villians Academy".center(50)
	puts "-----------".center(50)
end


def print_students_list
	@students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer
	puts "Overall, we have #{@students.count} great students"
	puts "Successfully completed actions for Option  2"
end



def save_students(user_filename)
#open the file for writing
	file = File.open(user_filename,"w")
	#iterate over the array of students
	@students.each do |student|
		student_data = [student[:name],student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
	puts "Successfully completed actions for Option 3. Student list have been saved"
end


def load_students(filename = user_filename)
	file = File.open(filename, "r")
	file.readlines.each do |line|
	name,cohort = line.chomp.split(',')
			populate_array(name)
	end
	file.close
end

def populate_array(name)
	@students << {name: name,cohort: cohort.to_sym}
end



def load_students_file
	filename = ARGV.first #first argument from the command line
 	if filename.nil?
		 	filename = "students.csv"
	elsif File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.count} from #{filename}"
	else
		puts "Sorry #{filename} not found"
		exit
	end
	puts "Successfully completed actions for Option 4.
end


load_students_file
interactive_menu
