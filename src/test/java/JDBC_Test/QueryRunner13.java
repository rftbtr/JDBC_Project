package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * Find the latest salaries for each employee
 *
 * Her çalışanın en son maaşlarını bul.</pre>
 */

public class QueryRunner13 extends DBUtility {
    @Test
    public void query13() {
        List<List<String>> data = getData("SELECT e.emp_no, e.first_name, e.last_name, s.salary, s.from_date\n" +
                "FROM employees e\n" + "JOIN salaries s ON e.emp_no = s.emp_no\n" + "JOIN (\n" + "    " +
                "SELECT emp_no, MAX(from_date) AS latest_date\n" + "    FROM salaries\n" + "    " +
                "GROUP BY emp_no\n" + ") latest_s ON s.emp_no = latest_s.emp_no AND s.from_date = latest_s.latest_date;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}