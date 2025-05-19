package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

public class QueryRunner17 extends DBUtility {
    @Test
    public void query01() {
        List<List<String>> data = getData("SELECT\n" +
                                          "    d.dept_name AS department,\n" +
                                          "    e.first_name,\n" +
                                          "    e.last_name,\n" +
                                          "    AVG(s.salary) AS avg_salary\n" +
                                          "FROM employees e\n" +
                                          "INNER JOIN dept_emp de ON e.emp_no = de.emp_no\n" +
                                          "INNER JOIN departments d ON de.dept_no = d.dept_no\n" +
                                          "INNER JOIN salaries s ON e.emp_no = s.emp_no\n" +
                                          "GROUP BY d.dept_name, e.emp_no, e.first_name, e.last_name\n" +
                                          "ORDER BY avg_salary DESC;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}
