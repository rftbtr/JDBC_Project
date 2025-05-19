package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

public class QueryRunner12 extends DBUtility {
    @Test
    public void query01() {
        List<List<String>> data = getData("select e.first_name, e.last_name, s.salary from employees.salaries s\n" +
                "join employees.employees e on e.emp_no= s.emp_no\n" +
                "order by s.salary desc\n" +
                "limit 1;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}
