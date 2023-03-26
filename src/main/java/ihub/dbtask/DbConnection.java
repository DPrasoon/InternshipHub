package ihub.dbtask;

import java.sql.*;
import java.util.*; //for rb

public class DbConnection {

	private static Connection con; // creating a variable of Connection interface
	private static ResourceBundle rb; // used to read data from properties file

	public static Connection openConnection() {
		try {

			rb = ResourceBundle.getBundle("ihub/dbtask/dbinfo"); // gives the reference of the properties file
			String dbId = rb.getString("db.Id");
			String dbPass = rb.getString("db.Pass");
			String dbUrl = rb.getString("db.url");
			String dbClass = rb.getString("db.className");

			// type 4 driver -> fastest driver, purely written in Java
			Class.forName(dbClass); // factory methods-> forName() is used to create the object of a
									// class(here Driver class) implicitly, without using new
									// keyword
			con = DriverManager.getConnection(dbUrl, dbId, dbPass); // connection
																	// string/url is
																	// contained in
																	// "" //creating
																	// a connection
		} catch (SQLException | ClassNotFoundException cs) {
			cs.printStackTrace();
		}
		return con;
	}// method close
}
