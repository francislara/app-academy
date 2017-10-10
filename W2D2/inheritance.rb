class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
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
  attr_reader :employees, :boss

  def initialize(name, title, salary, boss, employees = [])
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @employees = employees
  end

  def employee_add(employee)
    @employees << employee
  end

  def bonus(multiplier)
    total = 0
    employees.each do |employee|
      if employee.is_a?(Manager)
        total += (employee.salary + employee.bonus(1))
        # employee.employees.each do |subord|
        #
        # end

      else
        total += employee.salary
      end
    end
    total * multiplier
  end
end
