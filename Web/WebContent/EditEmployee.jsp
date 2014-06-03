<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>

<%
	Connection conn = null;
	PreparedStatement stmt = null;
	try
	{
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		conn = DriverManager.getConnection("jdbc:derby://localhost:1527/AjaxData");
		
		String sql = "UPDATE Employees SET " + request.getParameter("field") + " = ? WHERE EmployeeID = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, request.getParameter("value"));
		stmt.setString(2, request.getParameter("eid"));

		stmt.executeUpdate();
	}
	catch (Exception e)
	{
		out.write("Failed: <br/> " + e.toString());
	}
	finally 
	{
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}
%>