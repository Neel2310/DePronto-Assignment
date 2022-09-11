<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title></title>
	</head>
	<body>
	<%@ page import = "java.io.*" %>
	<%@ page import = "java.sql.*" %>
	
	<%
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	try{
 	Class.forName("com.mysql.cj.jdbc.Driver");
       	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "");
	PreparedStatement ps = con.prepareStatement("SELECT * FROM Emp");
	ResultSet rs = ps.executeQuery();
        while (rs.next())
        {
        	if(rs.getString(1).equals(username) && rs.getString(2).equals(password))
		{
			out.println("LOGIN SUCCESFUL");
		}
        }
	}
	catch(Exception e)
	{
		out.println("ERROR " + e);
	} 
	%>
	</body>
</html>