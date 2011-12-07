<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Database JSP</title>
</head>
<body>
	<form method="post">
    	EMPNO : <input type = "text" name="empNo">
    	ENAME : <input type = "text" name="eName">
    	JOB_TITLE: <input type = "text" name="job">
    	<button name ="button" value ="submit" type="submit">Input</button> 
    </form>
    <%
    	boolean control = false;
    	int empNo = 0;
    	String eName = "0";
    	String job = "0";
    	try {
    		empNo = Integer.parseInt(request.getParameter("empNo"));
    		eName = request.getParameter("eName");
    		job = request.getParameter("job");
    		control = true;
    	} catch (NullPointerException e1) {
    		control = false;
    	} catch (NumberFormatException e2) {
    		control = false;
    	}
    %>
    <%@ page import="java.sql.*" %>
    <%
    if (control) {
    	Connection conn = null;
		Statement stmt = null;
		
		try {
			conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Lesson22");
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			stmt.addBatch("insert into Employee " + "values("+empNo+",'"+eName+"','"+job+"')");
			stmt.executeBatch();
			conn.commit();
			
			out.println("Successful data transfer");
		} catch (SQLException se) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println("SQLError: " + se.getMessage() + " code: " + se.getErrorCode());
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}//finally
    }
    %>
</body>
</html>