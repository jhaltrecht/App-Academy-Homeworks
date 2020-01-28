class Employee
    attr_reader :name,:title,:salary,:boss
    def initialize(name,title,salary,boss)
        @name=name
        @title=title
        @salary=salary
        @boss=boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager<Employee
    def initialize(name,title,salary,boss)
        super
        @employees=[]
    end

    def bonus(multiplier)
        bonus = @employees.sum * multiplier
    end

    def addEmployee(employee)
    @employees<<employee if employee.boss==self.name
    end

end

david=Employee.new("David","TA",10000,"Darren")
shawna=Employee.new("Shawna","TA",12000,"Darren")

darren=Manager.new("Darren","TA Manager",78000,"Ned")
ned=Manager.new("Ned","Founder",1000000,nil)
darren.addEmployee(David)
darren.addEmployee(Shawna)
ned.bonus(5) # => 500_000
darren.bonus(4) #D => 88_000
david.bonus(3) # => 30_000

