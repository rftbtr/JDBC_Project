package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

public class QueryRunner20 extends DBUtility {
    @Test
    public void query20() {
        List<List<String>> data = getData("select e.first_name, e.last_name, e.hire_date, s.salary from employees.employees e\n" +
                                          "join dept_emp de on e.emp_no = de.emp_no\n" +
                                          "join departments d on de.dept_no = d.dept_no\n" +
                                          "join employees.salaries s on e.emp_no = s.emp_no\n" +
                                          "where hire_date between '1985-01-01' and '1989-12-31'\n" +
                                          "and d.dept_name = 'Sales'\n" +
                                          "order by s.salary desc;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}