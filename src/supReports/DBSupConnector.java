package supReports;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBSupConnector {
	public static String url = "jdbc:mysql://localhost:3306/";
    public static String dbName = "supplier1";
    public static String userName = "root";
    public static String password = "yasiya";
          public static Connection getConnection() {
          Connection connection = null;
          if (connection != null)
          {
                return connection;
          }
          try {
                     
                      Class.forName("com.mysql.jdbc.Driver").newInstance();
                      connection = DriverManager.getConnection(url+dbName,userName,password);
          } catch (Exception e) {
                e.printStackTrace();
          }
          return connection;
    }
}