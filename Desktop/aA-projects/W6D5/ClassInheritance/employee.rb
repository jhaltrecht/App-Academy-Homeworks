class Employee
    attr_reader :name,:title,:salary,:boss
    def initialize(name,title,salary,boss=nil)
        @name=name
        @title=title
        @salary=salary
        @boss=boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end

    def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?

    boss
  end
end

class Manager<Employee
    attr_reader :employees
    def initialize(name,title,salary,boss)
        super
        @employees=[]
    end

    def bonus(multiplier)
        bonus=0
         @employees.each do |employee|
            if isABoss?(employee)
                employeeBonus=employee.bonus(multiplier)
             bonus+= employee.salary * multiplier + employeeBonus
            else  bonus+= employee.salary * multiplier 
            end
        end
        bonus
    end

    def addEmployee(employee)
    @employees<<employee if employee.boss==self.name
    end

    def isABoss?(employee)
        return true if employee.is_a?(Manager)
        false
    end

end

david=Employee.new("David","TA",10000,"Darren")
shawna=Employee.new("Shawna","TA",12000,"Darren")

darren=Manager.new("Darren","TA Manager",78000,"Ned")
ned=Manager.new("Ned","Founder",1000000,nil)
darren.addEmployee(david)
darren.addEmployee(shawna)
ned.addEmployee(darren)
p ned.bonus(5) # => 500_000
p darren.bonus(4) #D => 88_000
p david.bonus(3) # => 30_000

