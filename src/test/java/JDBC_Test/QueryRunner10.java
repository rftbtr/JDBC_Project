package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * Find all salary changes for employee with emp. no '10102'
 *
 * '10102' iş numarasına sahip çalışanın tüm maaş değişikliklerini bul.</pre>
 */

public class QueryRunner10 extends DBUtility {
    @Test
    public void query01() {
        List<List<String>> data = getData("select e.emp_no, e.first_name, e.last_name, d.dept_name\n" +
                "from employees.employees e\n" +
                "join employees.dept_emp de on e.emp_no=de.emp_no\n" +
                "join employees.departments d on de.dept_no=d.dept_no\n" +
                "where d.dept_no='d001';");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}