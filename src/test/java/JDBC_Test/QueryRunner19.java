package JDBC_Test;

import org.testng.annotations.Test;
import utilities.DBUtility;

import java.util.List;

/**
 * <pre>
 * List the names, last names, hire dates of all employees hired between January 01, 1985 and December 31, 1989, sorted by hire date.
 *
 * 1985-01-01 ile 1989-12-31 tarihleri arasında işe alınan tüm çalışanların adlarını, soyadlarını ve işe alınma tarihlerini işe alınma tarihine göre sıralı olarak listele.</pre>
 */

public class QueryRunner19 extends DBUtility {
    @Test
    public void query19() {
        List<List<String>> data = getData("select first_name, last_name, hire_date from employees.employees\n" +
                "where hire_date between '1985-01-01' and '1989-12-31'\n" +
                "order by hire_date;");
        for (List<String> row : data) {
            System.out.println(row);
        }
    }
}