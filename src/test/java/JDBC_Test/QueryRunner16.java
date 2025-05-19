package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * For each department, identify the employee with the highest single salary ever recorded. List the department name, employee's first name, last name, and the peak salary amount. Order the results by the peak salary in descending order.
 *
 * Her departman için, kaydedilmiş en yüksek tek maaşı belirle. Departman adını, çalışanın adını, soyadını ve en yüksek maaş tutarını listele. Sonuçları en yüksek maaşa göre azalan şekilde sırala.</pre>
 */

public class QueryRunner16 extends DBUtility {
    @Test
    public void query16() {
        List<List<String>> data = getData("select d.dept_name, e.first_name, e.last_name, s.salary\n" +
                "from salaries s\n" +
                "join employees e on s.emp_no = e.emp_no\n" +
                "join dept_emp de on e.emp_no = de.emp_no\n" +
                "join departments d on de.dept_no = d.dept_no\n" +
                "join (select de.dept_no, max(s.salary) as max_salary\n" +
                "    from salaries s\n" +
                "    join dept_emp de on s.emp_no = de.emp_no\n" +
                "    group by de.dept_no) as max_salaries\n" +
                "on de.dept_no = max_salaries.dept_no and s.salary = max_salaries.max_salary\n" +
                "order by s.salary desc;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}