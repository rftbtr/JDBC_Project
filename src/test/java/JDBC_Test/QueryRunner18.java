package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

public class QueryRunner18 extends DBUtility {
    @Test
    public void query01() {
        List<List<String>> data = getData("select first_name, last_name, hire_date from employees.employees\n" +
                                          "where hire_date < '1990-01-01'\n" +
                                          "order by first_name, last_name;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}
