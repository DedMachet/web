DEFAULT_BALANCE = 100.0
BALANCE = 'balance.txt'

def balance
  puts "Ваш баланс #{@balance}"
end

def deposit
  print "Введите значение депозита "
  amount = gets.to_f

  if amount < 0
    puts "Значение должно быть > 0"
    amount = gets.to_f
  else
    @balance += amount
  end
end

def withdraw
  print "Введите значение для вывода "
  amount = gets.to_f

  if amount < 0 || amount > @balance
    puts "Значение долно быть > 0 и < значения баланса"
    amount = gets.to_f
  else
    @balance -= amount
  end
end

def start()
  if File.zero?(BALANCE)
    @balance = DEFAULT_BALANCE
  else
    @balance = File.readlines(BALANCE).first.chomp.to_f
  end

  puts "Ваш баланс #{@balance} нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)"

  loop do
    input = gets

    case input
    when "q\n"
      break
    when "b\n"
      balance
    when "w\n"
      withdraw
    when "d\n"
      deposit
    end

    puts "нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)"
  end

  File.write(BALANCE, @balance)
end

puts start
