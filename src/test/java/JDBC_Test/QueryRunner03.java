package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

public class QueryRunner03 extends DBUtility {
    @Test
    public void query03() {
        List<List<String>> data = getData("select avg(salary) as averageSalary from employees.salaries;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}
