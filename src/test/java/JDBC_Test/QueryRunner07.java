package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

public class QueryRunner07 extends DBUtility {
    @Test
    public void query07() {
        List<List<String>> data = getData("select e.emp_no, e.first_name, e.last_name, d.dept_name, s.salary\n" +
                "from employees.employees e\n" +
                "join employees.dept_emp de on e.emp_no=de.emp_no\n" +
                "join employees.departments d on de.dept_no=d.dept_no\n" +
                "join employees.salaries s on e.emp_no=s.emp_no\n" +
                "where s.salary between 50000 and 100000;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}
