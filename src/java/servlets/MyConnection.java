package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MyConnection {
    public static Connection connecte=null;
 
    public static Connection getMyConnection(){
        if(connecte==null){
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                connecte=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ayoubdatabase");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(MyConnection.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(MyConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return connecte;
    }
}
