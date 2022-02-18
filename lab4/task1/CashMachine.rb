class CashMachine
  DEFAULT_BALANCE = 100.0
  BALANCE = 'balance.txt'

  def initialize
    if File.zero?(BALANCE)
      @balance = DEFAULT_BALANCE
    else
      @balance = File.readlines(BALANCE).first.chomp.to_f
    end
  end

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

  def init
    puts "Ваш баланс #{@balance} нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)"

    loop do
      input = gets.chomp.downcase

      case input
      when "d"
        deposit
      when "w"
        withdraw
      when "b"
        balance
      end
      break if input == "q"

      puts "нажмите D (Для депозита) W (Для вывода) B (Показать баланс) Q(Выход)"
    end

    File.write(BALANCE, @balance)
  end
end

 cashMachine = CashMachine.new
 cashMachine.init
