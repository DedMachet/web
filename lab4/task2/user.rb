def ask_for_string(message)
  print "#{message}: "
  gets.chomp
end

def ask_for_int(message)
  print "#{message}: "
  gets.to_i
end

def print_result(message)
  puts "Результат: #{message}"
end

def print_with_iteration(iterations, function)
  iterations.times do |time|
    puts "====== [#{time+1}/#{iterations}] ======"
    function.call
    puts "\n"
  end
end
