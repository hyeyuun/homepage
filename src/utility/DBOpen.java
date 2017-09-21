package utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {
	public static Connection getConnection(){
		   Connection con = null;
		    
		   try {
		     Class.forName(Constant.DRIVER);
		     con = DriverManager.getConnection(Constant.URL, Constant.USER, Constant.PASSWORD);
		   } catch (Exception e) {
		     e.printStackTrace();
		   } 
		   
		   return con;
		   
		 }
}
