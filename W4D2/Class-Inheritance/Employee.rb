require 'byebug'
class Employee

    attr_accessor :salary, :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        self.boss = boss
    end

    def boss=(boss)
        # debugger
        @boss = boss
        if boss != nil
            boss.add_employees(self)
        end
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        # self.boss = boss
        @employees = []
    end

    def bonus(multiplier)
        bonus = 0
        self.get_all_employees.each { |employee| bonus += employee.salary * multiplier }
        bonus
    end

    def add_employees(employee)
        @employees << employee 
    end

    def get_all_employees
        # debugger
        all_employee = []
        queue = self.employees
        # p queue
        until queue.empty?
            current_employee = queue.shift
            all_employee << current_employee
            if current_employee.is_a?(Manager)
                queue.concat(current_employee.employees)
            end
        end

        all_employee
    end
end

ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawan = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
