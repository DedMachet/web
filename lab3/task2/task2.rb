INPUT = 'input.txt'
OUTPUT = 'result.txt'

def read_students
  input_file = File.open(INPUT)
  students = input_file.readlines.map(&:chomp)
  output_file = File.open(OUTPUT, "a")

  loop do
    break if students.size == 0

    puts 'Введите возраст студента'
    age = gets.to_i

    if age == -1
      puts 'Вы ввели -1 (ВЫХОД)'
      break
    end

    for stud in students
      File.write(OUTPUT, "#{stud}\n", mode:"a") if stud.include?("#{age}")
      students.delete(stud) if stud.include?("#{age}")
    end
  end

  output_file.close
  input_file.close

  File.foreach(OUTPUT){|student| puts student}
end

read_students
