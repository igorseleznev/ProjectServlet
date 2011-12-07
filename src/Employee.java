import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Employee {
	
	public static void main(String args[]) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet resultSet = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Lesson22");
			stmt = conn.createStatement();
			resultSet = stmt.executeQuery("Select * from Employee");
			
			while(resultSet.next()){
				int empNO = resultSet.getInt("EMPNO");
				String name = resultSet.getString("ENAME");
				String jobTitle = resultSet.getString("JOB_TITLE");
				
				System.out.println("" + empNO + ", " + name + ", " + jobTitle);
			}//while
		} catch (SQLException se) {
			System.out.println("SQLError: " + se.getMessage() + " code: " + se.getErrorCode());
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}//finally
	}//main
	
}
