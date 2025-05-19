package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

public class QueryRunner15 extends DBUtility {
    @Test
    public void query15() {
        List<List<String>> data = getData("select e.first_name, e.last_name, avg(s.salary) from employees.employees e\n" +
                                            "join employees.dept_emp de on e.emp_no = de.emp_no\n" +
                                            "join employees.departments d on de.dept_no = d.dept_no\n" +
                                            "join employees.salaries s on e.emp_no = s.emp_no\n" +
                                            "where d.dept_name = 'Research'\n" + "group by e.emp_no\n" +
                                            "order by avg(s.salary) desc limit 1;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}
