<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    	               "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
  		<title>SumOfNumber JSP</title>
  </head>
  <body>
    <form method="post">
    	a : <input type = "text" name="a">
    	b : <input type = "text" name="b">
    	<button name ="button" value ="submit" type="submit">Calculate sum</button> 
    </form>
    <%
    try{
    	double a = Double.parseDouble(request.getParameter("a"));
    	double b = Double.parseDouble(request.getParameter("b"));
    	out.println("<h2>"+a + " + " + b + " = " + (a + b)+"</h2>");
    } catch (NullPointerException e){ 
    	
    } catch (NumberFormatException ne) {
    	
    }
    %>
  </body>
</html> 
