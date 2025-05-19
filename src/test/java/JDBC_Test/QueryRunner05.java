package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * Calculate the average salary of all employees with gender "F"
 *
 * "Kadın" cinsiyetindeki tüm çalışanların ortalama maaşını hesapla.</pre>
 */

public class QueryRunner05 extends DBUtility {
    @Test
    public void query05() {
        List<List<String>> data = getData("select avg(s.salary) as averageSalaryWomen from employees.employees e\n" +
                "join employees.salaries s on e.emp_no=s.emp_no\n" +
                "where e.gender='F';");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}
