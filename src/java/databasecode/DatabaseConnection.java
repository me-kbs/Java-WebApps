package databasecode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
  
// This class can be used to initialize the database connection
public class DatabaseConnection{
    public static Connection initializeDatabase() 
    {
        // Initialize all the information regarding
        // Database Connection
        Connection con=null;
        try{
        String dbDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/";
        // Database name to access
        String dbName = "mydb?zeroDateTimeBehavior=convertToNull";
        String dbUsername = "root";
        String dbPassword = "";
  
        Class.forName(dbDriver);
        con = DriverManager.getConnection(dbURL + dbName,
                                                     dbUsername, 
                                                     dbPassword);
        }catch(SQLException e){
        e.printStackTrace();
        }
        catch(ClassNotFoundException e){
        e.printStackTrace();
        }
        return con;
    }
}