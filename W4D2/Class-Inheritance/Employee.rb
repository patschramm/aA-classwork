class Employee

    attr_accessor :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        if boss != nil
            @boss.add_employees(self)
        end
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss = nil)
        @employees = []
    end

    def bonus(multiplier)
        bonus = 0
        @employees.each { |employee| bonus += employee.salary * multiplier }
        bonus
    end

    def add_employees(employee)
        @employees << employee 
    end

    def get_all_employees
        all_employee = []
        queue = @employee
        until queue.empty?
            queue.first.
            all_employee << queue.shift
    end
end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawan = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
