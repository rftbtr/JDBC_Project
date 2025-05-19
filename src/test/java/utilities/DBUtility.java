package utilities;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUtility {
    public static Connection baglanti;
    public static Statement sorguEkrani;


    public static List<List<String>> getData(String sorgu) {
        List<List<String>> donecekTablo = new ArrayList<>();
        DBConnectionOpen();

        try {
            ResultSet rs = sorguEkrani.executeQuery(sorgu);
            ResultSetMetaData rsmd = rs.getMetaData();

            while (rs.next()) {
                List<String> satir = new ArrayList<>();
                for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                    satir.add(rs.getString(i));
                }
                donecekTablo.add(satir);
            }
        } catch (Exception ex) {
            System.out.println("ex.getMessage() = " + ex.getMessage());
        }
        DBConnectionClose();
        return donecekTablo;
    }

    public static void DBConnectionOpen() {
        String serverUrl = ConfigReader.getProperty("hostname");  //port,dbname,mySql
        String username = ConfigReader.getProperty("username");
        String password = ConfigReader.getProperty("password");
        String port = ConfigReader.getProperty("port");

        try {
            baglanti = DriverManager.getConnection(serverUrl, username, password);
            sorguEkrani = baglanti.createStatement();
        } catch (Exception ex) {
            System.out.println("ex.getMessage() = " + ex.getMessage());
        }
    }

    public static void DBConnectionClose() {
        try {
            baglanti.close();
        } catch (Exception ex) {
            System.out.println("ex.getMessage() = " + ex.getMessage());
        }
    }
}


