package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * List the first name, last name, and highest salary of employees in the "Sales" department. Order the list by highest salary descending and only show the employee with the highest salary.
 *
 * "Satış" departmanındaki çalışanların adını, soyadını ve en yüksek maaşını listele. Listeyi en yüksek maaşa göre azalan şekilde sırala ve sadece en yüksek maaşa sahip çalışanı göster.</pre>
 */

public class QueryRunner14 extends DBUtility {
    @Test
    public void query14() {
        List<List<String>> data = getData("select e.first_name, e.last_name, max(salary) from employees.employees e\n"
                + "join employees.dept_emp de on e.emp_no = de.emp_no\n" +
                "join employees.departments d on de.dept_no = d.dept_no\n" +
                "join employees.salaries s on e.emp_no = s.emp_no\n" +
                "where d.dept_name = 'Sales'\n" + "group by e.emp_no\n" +
                "order by max(salary) desc limit 1;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}