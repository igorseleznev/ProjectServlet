<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SumOfNumber Session</title>
</head>
<body>
	<form method="post">
    	a : <input type = "text" name="a">
    	b : <input type = "text" name="b">
    	<button name ="button" value ="submit" type="submit">Calculate sum</button> 
    </form>
    <%
    boolean control = false;
    try{
    	double a = Double.parseDouble(request.getParameter("a"));
    	double b = Double.parseDouble(request.getParameter("b"));
    	double sum = a + b;
    	session.setAttribute("sum", sum);
    	control = true;
    } catch (NullPointerException e){ 
    	control = false;
    } catch (NumberFormatException ne) {
    	control = false;
    }
    %>
    <% if (control) { %>
    	<jsp:forward page="/newPageSession.jsp" />
    <% } %>
</body>
</html>