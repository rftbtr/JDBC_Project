package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

public class QueryRunner11 extends DBUtility {
    @Test
    public void query01() {
        List<List<String>> data = getData("select first_name, last_name, salary, to_date from employees.salaries s\n" +
                "join employees.employees e on e.emp_no= s.emp_no\n" +
                "where e.emp_no='10102'\n" +
                "order by to_date asc;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}
