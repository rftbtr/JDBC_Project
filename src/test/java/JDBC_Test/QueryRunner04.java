package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * Calculate the average salary of all employees with gender "M"
 *
 * "Erkek" cinsiyetindeki tüm çalışanların ortalama maaşını hesapla.</pre>
 */

public class QueryRunner04 extends DBUtility {
    @Test
    public void query04() {
        List<List<String>> data = getData("select avg(s.salary) as averageSalaryMan from employees.employees e\n" +
                "join employees.salaries s on e.emp_no=s.emp_no\n" +
                "where e.gender='M';");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}