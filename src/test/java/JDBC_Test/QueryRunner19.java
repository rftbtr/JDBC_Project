package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

public class QueryRunner19 extends DBUtility {
    @Test
    public void query01() {
        List<List<String>> data = getData("select first_name, last_name, hire_date from employees.employees\n" +
                                          "where hire_date between '1985-01-01' and '1989-12-31'\n" +
                                          "order by hire_date;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}
