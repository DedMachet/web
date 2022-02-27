class CashMachine

    BALANCE = "balance.txt"
    DEFAULT_BALANCE = 100.0

    def initialize
        if !File.exist?(BALANCE)
            File.write(BALANCE, DEFAULT_BALANCE) 
            @balance = DEFAULT_BALANCE
        else
            @balance = File.readlines(BALANCE).first.to_f
        end
    end

    def balance
        @answ = {"code": 200, "text": "#{@balance}"}
    end
    
    def deposit(amount)
        if amount == nil 
            @answ = {"code": 406, "text": "Значение не может быть пустое!"}
        elsif amount <= 0
            @answ = {"code": 406, "text": "Значение для депозита должно быть больше нуля"}
        else
            @balance += amount
            File.write(BALANCE, @balance) 

            @answ = {"code": 200, "text": "#{@balance}"}
        end

        @answ
    end

    def withdraw(amount)
        if amount == nil 
            @answ = {"code": 406, "text": "Значение не может быть пустое!"}
        elsif @balance <= 0
            @answ = {"code": 406, "text": "На балансе нет денег."}
        elsif amount > 0 && amount <= @balance
            @balance -= amount
            File.write(BALANCE, @balance) 

            @answ = {"code": 200, "text": "#{@balance}"}
        else
            @answ = {"code": 406, "text": "Сумма для вывода должна быть больше нуля и не превышать сумму баланса!"}
        end

        @answ

    end

    def call(map, env)
        req = Rack::Request.new(env)
        case req.path
        when '/deposit'
            if (map.include?("value"))
                answer = deposit(map["value"].to_i)
                [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
            end
        when '/withdraw'
            if (map.include?("value"))
                answer = withdraw(map["value"].to_i)
                [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
            end
        when '/balance'
            answer = balance()
            [answer[:code], {'Content-Type' => 'text/html'}, [answer[:text]]]
        else
            [404, {'Content-Type' => 'text/html'}, ["Не найдено"]]
        end
    end

end
