class Employee

    attr_reader :salary

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee

    def initialize
        super
        @employees = []
    end

    def bonus(multiplier)
        bonus = 0
        @employees.each { |employee| bonus += employee.salary * multiplier }
        bonus
    end

    def add_employees
        
    end
end