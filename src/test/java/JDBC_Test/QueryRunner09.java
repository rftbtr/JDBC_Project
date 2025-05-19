package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * Calculate the average salary for each department, including department names
 *
 * Departman adlarını da içeren her departmanın ortalama maaşını hesapla.</pre>
 */

public class QueryRunner09 extends DBUtility {
    @Test
    public void query09() {
        List<List<String>> data = getData("select d.dept_name, avg(s.salary) as averageSalary from employees.salaries s\n" +
                "join employees.dept_emp de on s.emp_no=de.emp_no\n" +
                "join employees.departments d on de.dept_no=d.dept_no\n" +
                "group by d.dept_name;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}