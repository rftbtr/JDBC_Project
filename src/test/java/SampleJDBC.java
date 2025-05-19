import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import java.sql.*;

public class SampleJDBC {

    @Test
    public void Test() throws SQLException {

        // URL contains "jdbc(main protocol):mysql(sub protocol for mySql)://localhost:3306(sub name for mysql (host:port))/employees(database)"
        // and this method return type is Connection Object ...
        String hostURL = "jdbc:mysql://db-technostudy.ckr1jisflxpv.us-east-1.rds.amazonaws.com";
        String dbSchema = hostURL + "/employees";
        String username = "root";
        String password = "'\"-LhCB'.%k[4S]z";

         // For establishing con with database we call static method called getConnection(...) present in DriverManager Class.
         // This method contains three arguments of string type. i.e., url, username and password
        Connection con = DriverManager.getConnection(dbSchema, username, password);

        // For creating st object we need to call a method called createStatement() which is present in Connection Interface.
        // And this method returns Statement object, it is no argument method.
        Statement st = con.createStatement();

        // For executing select queries(for fetching records) we call a method called executeQuery(String qry) by taking string as parameter.
        // This method returns ResultSet object.
        ResultSet rs = st.executeQuery("select * from employees");
        // Once executeQuery() executes the query and stores the records in to ResultSet object.

        // Now we need to get the records from ResultSet object.
        // To access the resultset object it uses a method called next() which presents in ResultSet Interface.
        // By default, Resultset reference 'rs' points to before first row. it moves rs to next row and returns true.
        // When it returns true we retrieve the data in first row. next() returns false when rs points to after the last row.
        // this next() will repeats the execution using while loop till it returns false.
        int i =0;
        while(rs.next() && i!=20) {
            i++;
            int empID= rs.getInt("emp_no");
            String birthDate= rs.getString("birth_date");
            String name=rs.getString(3);
            String surname= rs.getString(4);
            String gender=rs.getString("gender");
            Date hireDate=rs.getDate("hire_date");
            System.out.println(empID+"\t"+birthDate+"\t"+name+"\t"+surname+"\t"+gender+"\t"+hireDate);
        }
        // Once execution of all statements were completed we need to close all the connections
        // by using method called close() present in Connection interface
        con.close();

        /////////////////////////////////////////////////////////////////////////////////////////////////

        System.out.println("**************************************************************");
        con = DriverManager.getConnection(dbSchema, username, password);
        st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        rs = st.executeQuery("select * from departments");
        String dept_name;

        rs.absolute(2);
        dept_name = rs.getString("dept_name");

        System.out.println("    |   Department Name = " + dept_name);
        System.out.println("**************************************************************");

        rs.relative(4);
        dept_name = rs.getString("dept_name");
        System.out.println("    |   name = " + dept_name);
        System.out.println("**************************************************************");

        rs.relative(-5);
        dept_name = rs.getString("dept_name");
        System.out.println("    |   name = " + dept_name);

        System.out.println("**************************************************************");

        rs.last();
        dept_name = rs.getString("dept_name");
        System.out.println("last dept_name = " + dept_name);

        rs.first();
        dept_name = rs.getString("dept_name");
        System.out.println("first dept_name = " + dept_name);

        System.out.println("**************************************************************");

        rs.last();
        int rowCount = rs.getRow();
        System.out.println("Total Row = " + rowCount);

        System.out.println("**************************************************************");
        con.close();
    }
}


