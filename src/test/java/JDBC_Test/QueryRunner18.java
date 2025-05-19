package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * List the names, last names, and hire dates in alphabetical order of all employees hired before January 01, 1990.
 *
 * 1990-01-01 tarihinden önce işe alınan tüm çalışanların adlarını, soyadlarını ve işe alınma tarihlerini alfabetik sırayla listele.</pre>
 */

public class QueryRunner18 extends DBUtility {
    @Test
    public void query18() {
        List<List<String>> data = getData("select first_name, last_name, hire_date from employees.employees\n" +
                "where hire_date < '1990-01-01'\n" +
                "order by first_name, last_name;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}