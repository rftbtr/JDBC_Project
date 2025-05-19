package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * List all employees in 'Human Resources' department.
 *
 * 'İnsan Kaynakları' departmanındaki tüm çalışanları listele.</pre>
 */

public class QueryRunner02 extends DBUtility {
    @Test
    public void query02() {
        List<List<String>> data = getData("select e.emp_no, e.first_name, e.last_name, d.dept_name\n" +
                "from employees.employees e\n" +
                "join employees.dept_emp de on e.emp_no=de.emp_no\n" +
                "join employees.departments d on de.dept_no=d.dept_no\n" +
                "where d.dept_no='d003';");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}