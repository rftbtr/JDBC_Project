package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * Calculate the average salary for each department (by department number or department name)
 *
 * Her departmanın ortalama maaşını hesapla (departman numarasına veya departman adına göre).</pre>
 */

public class QueryRunner08 extends DBUtility {
    @Test
    public void query08() {
        List<List<String>> data = getData("select d.dept_no, avg(s.salary) as averageSalary from employees.salaries s\n" +
                "join employees.dept_emp de on s.emp_no=de.emp_no\n" +
                "join employees.departments d on de.dept_no=d.dept_no\n" +
                "group by d.dept_no;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}